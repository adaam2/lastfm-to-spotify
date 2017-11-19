module LastFm
  class Client
    def get_session(auth_token)
      auth
        .get_session(auth_token)
    end

    def weekly_track_chart(week_start, week_end)
      chart = user
        .get_weekly_track_chart(
          user: "adaam2",
          from: to_ticks(week_start),
          to: to_ticks(week_end)
        )

      return [] unless chart

      chart.map { |t| t.deep_symbolize_keys! }
    end

    private

    def to_ticks(datetime)
      datetime
        .to_time
        .to_i
    end

    def auth
      client.auth
    end

    def user
      client.user
    end
  end
end