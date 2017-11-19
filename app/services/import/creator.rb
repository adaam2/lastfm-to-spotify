module Import
  class Creator
    def call(user, name = "My import")
      import = user.imports.create!(
        name: name
      )
      yield import if block_given?
      import
    end
  end
end