class BaseJob < ActiveJob::Base
  queue_as :default
end
