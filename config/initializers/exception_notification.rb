if Rails.env.production?
  Rails.application.config.middleware.use ExceptionNotification::Rack,
    slack: { webhook_url: 'https://hooks.slack.com/services/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',
             channel: 'errors' }

end
