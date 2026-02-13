require "minitest/autorun"
require "nokogiri"
require "pathname"
require "uri"
require_relative "../test_helper"

class FormActionTest < Minitest::Test
  EXPECTED_HOST = "nateberkopec.us11.list-manage.com"
  EXPECTED_PATH = "/subscribe/post"
  REQUIRED_QUERY_KEYS = %w[u id].freeze

  def setup
    TestHelper.ensure_site_built!
  end

  def test_form_actions_are_valid_mailchimp_subscribe_endpoints
    actions_with_locations = collect_form_actions

    refute actions_with_locations.empty?, "Expected at least one form[action] in built site"

    failures = actions_with_locations.filter_map do |action, locations|
      validate_action(action, locations)
    end

    assert failures.empty?, failures.join("\n\n")
  end

  private

  def collect_form_actions
    actions = Hash.new { |hash, key| hash[key] = [] }

    Dir.glob(File.join(TestHelper::SITE_DIR, "**", "*.html")).sort.each do |file_path|
      doc = Nokogiri::HTML(File.read(file_path))
      relative_path = Pathname.new(file_path).relative_path_from(Pathname.new(TestHelper::SITE_DIR)).to_s

      doc.css("form[action]").each do |form|
        action = form["action"].to_s.strip
        next if action.empty?

        actions[action] << relative_path
      end
    end

    actions
  end

  def validate_action(raw_action, locations)
    uri = parse_action_uri(raw_action)
    return format_failure(raw_action, locations, "Could not parse URI") unless uri

    issues = []
    issues << "scheme #{uri.scheme.inspect} (expected \"https\")" unless uri.scheme == "https"
    issues << "host #{uri.host.inspect} (expected #{EXPECTED_HOST.inspect})" unless uri.host == EXPECTED_HOST
    issues << "path #{uri.path.inspect} (expected #{EXPECTED_PATH.inspect})" unless uri.path == EXPECTED_PATH

    params = URI.decode_www_form(uri.query.to_s).to_h
    missing_keys = REQUIRED_QUERY_KEYS.reject { |key| params[key].to_s.length.positive? }
    issues << "missing query keys: #{missing_keys.join(", ")}" if missing_keys.any?

    return if issues.empty?

    format_failure(raw_action, locations, issues.join("; "))
  end

  def parse_action_uri(raw_action)
    normalized = raw_action.start_with?("//") ? "https:#{raw_action}" : raw_action
    URI.parse(normalized)
  rescue URI::InvalidURIError
    nil
  end

  def format_failure(action, locations, details)
    <<~MSG.strip
      Invalid form action: #{action}
        #{details}
        from: #{locations.first}
    MSG
  end
end
