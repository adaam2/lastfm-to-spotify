class ImportJob < BaseJob
  include Registry::AutoInject[
    "importer",
    "exporter"
  ]

  def perform
    importer.call(user)
  end

  private

  def user
    User.first
  end
end
