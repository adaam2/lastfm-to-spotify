module Facades
  class Importer
    include Registry::AutoInject[
      lastfm_client: "lastfm.client",
      import_creator: "import.creator",
      batch_upserter: "track.batch_upserter"
    ]

    def call(user)
      @user = user

      import_creator.call(user) do |import|
        start_date = registration_date

        while start_date <= now
          end_date = add_days(start_date)

          Rails.logger.info "***"
          Rails.logger.info "Processing date range #{start_date} to #{end_date}"

          tracks = lastfm_client.weekly_track_chart(start_date, end_date)

          batch_upserter.call(import, tracks)

          start_date = add_days(end_date, 1)
        end
      end
    end

    private

    def now
      DateTime.current
    end

    def registration_date
      @user.lastfm_registration_date
    end

    def add_days(start, days_to_add = 7)
      start + days_to_add.days
    end
  end
end