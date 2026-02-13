require "liquid"
require_relative "test_helper"
require_relative "../../_plugins/array_intersection"

class ArrayIntersectionFilterTest < Minitest::Test
  def test_intersect_handles_csv_strings
    filter = build_filter

    result = filter.intersect("a, b, c", "b, d")

    assert_equal ["b"], result
  end

  def test_intersect_handles_arrays
    filter = build_filter

    result = filter.intersect(["x", "y"], ["y", "z"])

    assert_equal ["y"], result
  end

  def test_intersection_returns_true_when_any_match
    filter = build_filter

    assert_equal true, filter.intersection("a,b", "b,c")
  end

  def test_intersection_returns_false_when_no_match
    filter = build_filter

    assert_equal false, filter.intersection("a,b", "c,d")
  end

  private

  def build_filter
    Object.new.extend(Jekyll::ArrayIntersectionFilter)
  end
end
