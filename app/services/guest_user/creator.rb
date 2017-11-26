module GuestUser
  class Creator
    def call(metadata = {})
      User.create!
    end
  end
end
