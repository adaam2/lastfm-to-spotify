module Imports
  class Creator
    DEFAULT_NAME = "My Import".freeze

    include Registry::AutoInject[
      "import.eraser"
    ]

    def call(user, &block)
      @user = user

      #clear_existing_imports

      import = user.imports.create!(
        name: DEFAULT_NAME
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