class RecordLogsController < ApplicationController
  def index
    @record_logs = RecordLog.all.sort_by { |record| record.date }[1..30]
  end
end
