class CreateEcmOpeningTimesBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :ecm_opening_times_branches do |t|
      t.string :name
      t.string :identifier
      t.integer :position

      t.timestamps
    end
  end
end
