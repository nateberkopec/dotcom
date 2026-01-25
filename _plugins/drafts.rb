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
    end
  end
end
