module Imports
  # Deletes all other imports pre-existent for a user
  class Eraser
    def call(user)
      user.imports.destroy_all
    end
  end
end