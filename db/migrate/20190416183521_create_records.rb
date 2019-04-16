class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :source_ip
      t.integer :user_id

      t.timestamps
    end
  end
end
