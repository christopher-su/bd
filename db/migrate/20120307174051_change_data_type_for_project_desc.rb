class ChangeDataTypeForProjectDesc < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.change :desc, :text
    end
  end

  def self.down
    change_table :projects do |t|
      t.change :desc, :string
    end
  end
end
