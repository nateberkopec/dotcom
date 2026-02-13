require "bundler"
require "fileutils"
require "net/http"
require "rbconfig"
require "uri"

module TestHelper
  ROOT_DIR = File.expand_path("..", __dir__)
  SITE_DIR = File.expand_path("../_site", __dir__)
  LOCAL_BASE_URL = ENV.fetch("BASE_URL", "http://127.0.0.1:43123")
  SERVER_SCRIPT = File.join(ROOT_DIR, "test", "integration", "server.rb")

  def self.ensure_site_built!
    return if @site_built

    FileUtils.rm_rf(SITE_DIR)

    Dir.chdir(ROOT_DIR) do
      Bundler.with_unbundled_env do
        system("bundle", "exec", "jekyll", "build", "--quiet", exception: true)
      end
    end

    @site_built = true
  end

  def self.start_site_server!
    return unless local_base_url?
    return if @server_pid

    uri = URI.parse(LOCAL_BASE_URL)

    env = {
      "TEST_SERVER_HOST" => uri.host,
      "TEST_SERVER_PORT" => uri.port.to_s,
      "TEST_SITE_DIR" => SITE_DIR
    }

    @server_pid = Process.spawn(env, RbConfig.ruby, SERVER_SCRIPT, chdir: ROOT_DIR, out: File::NULL, err: File::NULL)
    wait_for_server!(uri)

    at_exit { stop_site_server! }
  end

  def self.stop_site_server!
    return unless @server_pid

    Process.kill("TERM", @server_pid)
    Process.wait(@server_pid)
  rescue Errno::ESRCH, Errno::ECHILD
    nil
  ensure
    @server_pid = nil
  end

  def self.local_base_url?
    uri = URI.parse(LOCAL_BASE_URL)
    ["127.0.0.1", "localhost"].include?(uri.host)
  rescue URI::InvalidURIError
    false
  end

  def self.wait_for_server!(uri)
    60.times do
      begin
        response = Net::HTTP.start(uri.host, uri.port, open_timeout: 1, read_timeout: 1) do |http|
          http.request(Net::HTTP::Get.new("/"))
        end
        return if response
      rescue StandardError
        sleep 0.1
      end
    end

    stop_site_server!
    raise "Test server did not start at #{uri}"
  end
end
