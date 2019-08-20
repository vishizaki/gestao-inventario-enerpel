class RecordLogsController < ApplicationController
  def index
    @record_logs = RecordLog.all.order("date DESC")
  end
end
