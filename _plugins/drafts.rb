module Jekyll
  class DraftsGenerator < Generator
    priority :highest

    def generate(site)
      # Check if we're in dev mode
      dev_mode = site.config['drafts_dev_mode'] || false

      return unless site.collections.key?('drafts')

      drafts_collection = site.collections['drafts']

      unless dev_mode
        # Filter out drafts without draft: true flag
        drafts_collection.docs.reject! do |draft|
          !draft.data['draft']
        end
      end

      # Validate draft dates
      drafts_collection.docs.each do |draft|
        validate_draft_date(draft)
      end
    end

    def validate_draft_date(draft)
      return unless draft.data['date']

      draft_date = draft.data['date'].to_date
      today = Date.today

      # Fail build if draft has a pub date > 30 days in the past
      if draft_date < (today - 30)
        raise "Suspicious old pub date in draft: #{draft.path} has date #{draft_date} (older than 30 days)"
      end
    end
  end
end
