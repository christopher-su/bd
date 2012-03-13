class CreatePropics < ActiveRecord::Migration
  def self.up
    create_table :propics do |t|
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :propics
  end
end
