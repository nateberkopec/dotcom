require "minitest/autorun"
require "net/http"
require "uri"
require_relative "../test_helper"

class SiteTest < Minitest::Test
  BASE_URL = ENV.fetch("BASE_URL", "http://127.0.0.1:43123")

  def setup
    TestHelper.ensure_site_built!
    TestHelper.start_site_server!
  end

  def test_homepage_loads
    response = get("/")

    assert_equal "200", response.code
    assert_includes response["content-type"], "text/html"
  end

  def test_blog_index_loads
    response = get("/blog/")

    assert_equal "200", response.code
  end

  def test_feed_exists
    response = get("/feed.xml")

    assert_equal "200", response.code
  end

  def test_robots_exists
    response = get("/robots.txt")

    assert_equal "200", response.code
  end

  def test_missing_page_is_404
    response = get("/this-page-does-not-exist-12345")

    assert_equal "404", response.code
  end

  private

  def get(path)
    uri = URI.parse("#{BASE_URL}#{path}")

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == "https", open_timeout: 10, read_timeout: 10) do |http|
      http.request(Net::HTTP::Get.new(uri.request_uri))
    end
  end
end
