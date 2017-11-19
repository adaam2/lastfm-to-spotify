if defined?(Bullet) && Rails.env.development?
  Rails.application.config.after_initialize do
    Bullet.enable = true
    Bullet.alert = false
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
    Bullet.rollbar = false
  end
end