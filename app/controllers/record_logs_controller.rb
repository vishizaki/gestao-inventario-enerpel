class RecordLogsController < ApplicationController
  def index
    @record_logs = RecordLog.all.sort_by { |record| record.date }
    @final_products = FinalProduct.all
  end
end
