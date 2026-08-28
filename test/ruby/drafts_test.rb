require "jekyll"
require_relative "../../_plugins/drafts"
require_relative "test_helper"

class DraftsTest < Minitest::Test
  Draft = Struct.new(:data, :path)

  def test_thirty_day_old_draft_uses_utc_date_for_cutoff
    now = Time.utc(2026, 2, 1, 15, 30)
    draft = Draft.new({ "date" => Time.utc(2026, 1, 2) }, "_drafts/example.md")

    with_current_dates(now:, local_today: Date.new(2026, 2, 2)) do
      assert_nil Jekyll::DraftsGenerator.new.validate_draft_date(draft)
    end
  end

  def test_draft_older_than_thirty_days_is_rejected
    now = Time.utc(2026, 2, 1, 15, 30)
    draft = Draft.new({ "date" => Time.utc(2026, 1, 1) }, "_drafts/example.md")

    with_current_dates(now:, local_today: Date.new(2026, 2, 2)) do
      error = assert_raises(RuntimeError) do
        Jekyll::DraftsGenerator.new.validate_draft_date(draft)
      end
      assert_match "older than 30 days", error.message
    end
  end

  private

  def with_current_dates(now:, local_today:)
    original_time_now = Time.method(:now)
    original_date_today = Date.method(:today)
    original_verbose = $VERBOSE
    $VERBOSE = nil
    Time.define_singleton_method(:now) { now }
    Date.define_singleton_method(:today) { local_today }
    $VERBOSE = original_verbose
    yield
  ensure
    $VERBOSE = nil
    Time.define_singleton_method(:now, original_time_now)
    Date.define_singleton_method(:today, original_date_today)
    $VERBOSE = original_verbose
  end
end
