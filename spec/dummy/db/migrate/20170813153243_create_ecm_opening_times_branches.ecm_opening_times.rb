# This migration comes from ecm_opening_times (originally 20170813125535)
class CreateEcmOpeningTimesBranches < ActiveRecord::Migration[5.1]
  def change
    create_table :ecm_opening_times_branches do |t|
      t.string :name

      t.timestamps
    end
  end
end
