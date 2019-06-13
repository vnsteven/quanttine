class CreateDailyServices < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_services do |t|
      t.datetime :date
      t.references :school, foreign_key: true
      t.string :queue

      t.timestamps
    end
  end
end
