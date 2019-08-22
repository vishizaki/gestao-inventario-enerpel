class RecordLogsController < ApplicationController
  def index
    display = params[:query]
    display_all = params[:display]
    if (display == "todos") || (display_all == "display_all")
      @record_logs = RecordLog.all.order("date DESC")
      @record_text = "(Todos os registros)"
    elsif display != nil
      @record_logs = RecordLog.all.order("date DESC")[0..display.to_i]
      @record_text = "(Últimos #{display} registros)"
    else
      @record_logs = RecordLog.all.order("date DESC")[0..30]
      @record_text = "(Últimos 30 registros)"
    end
  end
end
