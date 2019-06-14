require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Quanttine
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.autoload_paths += %W(#{config.root}/lib)   
    config.autoload_paths << Rails.root.join('lib')
    config.paths['app/views'] << "app/views/devise"
    config.load_defaults 5.2
    config.i18n.default_locale = :fr

    ActiveStorage::Engine.config.active_storage.content_types_to_serve_as_binary.delete('image/svg+xml')
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
