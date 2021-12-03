require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NextBosyuBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.active_job.queue_adapter = :sidekiq
    ## TimeZoneの設定
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

    ## RSpecの設定(リクエストテストができるようにしておく) + テストデータの生成はfactroy_botによって行う
    config.generators do |g|
      g.test_framework :rspec,
                       request_specs: true
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end

    config.api_only = true

    # config.i18n.default_locale = :ja
    config.i18n.default_locale = :en
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.yml').to_s]

    # Cookie
    # Omniauth用のapplication設定(今後変更する可能性あり)
    # config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CacheStore

    # Same-Site
    config.action_dispatch.cookies_same_site_protection = nil
  end
end
