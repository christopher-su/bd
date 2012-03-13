class ChangeDataTypeForCategoryDesc < ActiveRecord::Migration
  def self.up
    change_table :categories do |t|
      t.change :desc, :text
    end
  end

  def self.down
    change_table :categories do |t|
      t.change :desc, :string
    end
  end
end
