class CreateAdvpics < ActiveRecord::Migration
  def self.up
    create_table :advpics do |t|
      t.text :desc
      t.integer :serv_type

      t.timestamps
    end
  end

  def self.down
    drop_table :advpics
  end
end
