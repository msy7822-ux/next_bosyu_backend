## 開発環境でのエラーログは出力しない:
unless Rails.env.development?
  Sentry.init do |config|
    config.dsn = 'https://00d111286450433ba944a447772c2568@o1079331.ingest.sentry.io/6084009'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]

    # Set tracesSampleRate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end
end
