module GuestUser
  class Creator
    def call(token:)
      User.find_or_create_by!(token: token)
    end
  end
end
