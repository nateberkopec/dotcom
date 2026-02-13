require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/mathjaxtag"

class MathjaxTagTest < Minitest::Test
  def test_math_tag_renders_display_script_open
    result = Liquid::Template.parse("{% math %}").render

    assert_equal '<script type="math/tex; mode=display">', result
  end

  def test_endmath_tag_renders_script_close
    result = Liquid::Template.parse("{% endmath %}").render

    assert_equal "</script>", result
  end
end
