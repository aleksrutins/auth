require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Auth
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # Setup structured logging
    config.semantic_logger.application = "auth"
    config.semantic_logger.environment = ENV["STACK_NAME"] || Rails.env
    config.log_level = ENV["LOG_LEVEL"] || :info

    # Switch to JSON Logging output to stdout when running in prod
    if ENV["LOG_TO_CONSOLE"] || ENV["KUBERNETES_SERVICE_HOST"] || ENV["RAILWAY_PUBLIC_DOMAIN"]
      config.rails_semantic_logger.add_file_appender = false
      config.semantic_logger.add_appender(io: $stdout, formatter: :json)
    end
  end
end
