module Facades
  class Importer
    include Registry::AutoInject[
      lastfm_client: "lastfm.client",
      import_creator: "import.creator"
    ]

    def call(user)
      import_creator.call(user) do |import|

      end
    end
  end
end