module Imports
  class Creator
    include Registry::AutoInject[
      "import.eraser"
    ]

    def call(user, name = "My import")
      @user = user

      import = user.imports.create!(
        name: name
      )
      yield import if block_given?
      import
    end

    private

    def clear_existing_imports
      eraser.call(@user)
    end
  end
end