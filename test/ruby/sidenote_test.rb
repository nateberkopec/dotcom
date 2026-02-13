require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/sidenote"

class SidenoteTagTest < Minitest::Test
  def test_render_includes_number_and_note_text
    result = Liquid::Template.parse('{% sidenote 4 "A note" %}').render

    assert_includes result, "sidenote-number'>4"
    assert_includes result, "A note"
    assert_includes result, "class='sidenote'"
  end
end
