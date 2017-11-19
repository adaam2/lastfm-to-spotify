module Imports
  # Deletes all imports pre-existent for a user
  class Eraser
    def call(user)
      # We use delete_all here because there are no callbacks to care about.
      user.imports.destroy_all
    end
  end
end