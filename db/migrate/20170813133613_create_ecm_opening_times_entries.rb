class CreateEcmOpeningTimesEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :ecm_opening_times_entries do |t|
      t.references :branch
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.integer :open_at
      t.integer :close_at

      t.timestamps
    end
  end
end
