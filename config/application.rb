require_relative "boot"

require "rails/all"

# Dotenvで環境変数を読み込む
Dotenv::Railtie.load if defined?(Dotenv)

Bundler.require(*Rails.groups)

module Furima422322
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_paths += %W(#{config.root}/app/models)
    config.autoload_lib(ignore: %w(assets tasks))
  end
end

