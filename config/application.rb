require_relative 'boot'

require 'rails/all'

require_relative 'property'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Xiaopang
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.autoload_paths << "lib/fwk"
    config.autoload_paths << "lib/utils"

    config.after_initialize do

    end

    config.generators do |g|
      #g.assets false
      #g.helper false
      g.test_framework nil
    end

    config.active_job.queue_adapter = :sidekiq

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
