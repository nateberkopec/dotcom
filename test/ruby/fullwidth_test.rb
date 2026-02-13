require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/fullwidth"

class FullwidthTagTest < Minitest::Test
  def test_render_includes_image_and_caption
    result = Liquid::Template.parse('{% fullwidth /img/x.png "Caption" %}').render

    assert_includes result, "class='fullwidth'"
    assert_includes result, "/img/x.png"
    assert_includes result, "Caption"
  end
end
