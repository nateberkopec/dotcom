require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/main_column_img"

class MainColumnTagTest < Minitest::Test
  def test_render_includes_image_and_caption
    result = Liquid::Template.parse('{% maincolumn /img/z.png "Cap" %}').render

    assert_includes result, "class='fullwidth'"
    assert_includes result, "/img/z.png"
    assert_includes result, "Cap"
  end
end
