class RecordLogsController < ApplicationController
  def index
    @record_logs = RecordLog.all.order("date DESC")[0..30]
  end
end
