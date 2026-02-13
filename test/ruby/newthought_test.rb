require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/newthought"

class NewthoughtTagTest < Minitest::Test
  def test_render_wraps_content_in_newthought_span
    result = Liquid::Template.parse('{% newthought "Important" %}').render

    assert_includes result, "<span class='newthought'>Important</span>"
  end
end
