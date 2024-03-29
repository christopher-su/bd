class CreateTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :team_members do |t|
      t.string :name
      t.string :hashed_pwd
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :team_members
  end
end
