class ImportJob < BaseJob
  include Registry::AutoInject[
    "importer",
    "exporter"
  ]

  def perform(user_id)
    importer.call(user)
  end

  private

  def user
    User.first
  end
end
