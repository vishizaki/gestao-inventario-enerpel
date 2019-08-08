class CreateRecordLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :record_logs do |t|
      t.string :title
      t.string :date

      t.timestamps
    end
  end
end
