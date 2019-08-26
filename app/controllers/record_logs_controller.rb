class RecordLogsController < ApplicationController
  def index
    display = params[:query]
    display_all = params[:display]
    if RecordLog.all.empty?
      @record_logs = []
      @record_text = "(Não há nenhum registro)"
    elsif (display == "todos") || (display_all == "display_all")
      @record_logs = RecordLog.all.order("date DESC")
      @record_text = "(Todos os registros)"
    elsif display != nil
      @record_logs = RecordLog.all.order("date DESC")[0..(display.to_i - 1)]
      @record_text = "(Últimos #{display.to_i} registros)"
    else
      @record_logs = RecordLog.all.order("date DESC")[0..29]
      @record_text = "(Últimos 30 registros)"
    end
  end
end
