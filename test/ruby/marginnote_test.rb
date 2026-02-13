require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/marginnote"

class MarginnoteTagTest < Minitest::Test
  def test_render_wraps_content_in_marginnote_span
    result = Liquid::Template.parse('{% marginnote "hello" %}').render

    assert_includes result, "<span class='marginnote'>hello</span>"
  end
end
