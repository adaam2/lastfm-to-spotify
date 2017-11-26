class DeleteOldUsersJob < BaseJob
  def perform
    matching_users.destroy_all
  end

  private

  def matching_users
    User.where("token_generation_date < now() - interval '30 days'")
  end
end
