module GuestUser
  class Creator
    def call(token:)
      return new_user unless token.present?
      User.find_or_create_by!(token: token)
    end

    private

    def new_user
      User.create!
    end
  end
end
