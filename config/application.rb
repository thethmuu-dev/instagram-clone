require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InstaClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.initialize_on_precompile = false
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end
