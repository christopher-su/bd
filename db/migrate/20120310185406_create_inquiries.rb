class CreateInquiries < ActiveRecord::Migration
  def self.up
    create_table :inquiries do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :country
      t.string :company
      t.string :profession
      t.text :desc
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inquiries
  end
end
