require "yaml"
require_relative "test_helper"

class PostMetadataTest < Minitest::Test
  def test_published_posts_have_summary_and_readtime
    missing = Dir[File.expand_path("../../_posts/*.md", __dir__)].filter_map do |path|
      front_matter = File.read(path).match(/\A---\n(.*?)\n---/m)&.[](1)
      metadata = YAML.safe_load(front_matter || "", permitted_classes: [Date, Time], aliases: true) || {}

      next if metadata["draft"]

      missing_fields = %w[summary readtime].select { |field| metadata[field].to_s.strip.empty? }
      next if missing_fields.empty?

      "#{path}: missing #{missing_fields.join(", ")}"
    end

    assert_empty missing, missing.join("\n")
  end
end
