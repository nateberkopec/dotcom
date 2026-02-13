require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/margin_figure"

class MarginFigureTagTest < Minitest::Test
  def test_render_includes_image_and_caption
    result = Liquid::Template.parse('{% marginfigure /img/y.png "Cap" %}').render

    assert_includes result, "class='marginnote'"
    assert_includes result, "/img/y.png"
    assert_includes result, "Cap"
  end
end
