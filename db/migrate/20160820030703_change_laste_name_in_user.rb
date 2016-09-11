class ChangeLasteNameInUser < ActiveRecord::Migration
  def change
    rename_column :users, :laste_name, :last_name
  end
end
