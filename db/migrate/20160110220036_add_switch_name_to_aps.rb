class AddSwitchNameToAps < ActiveRecord::Migration
  def change
    add_column :aps, :switch_name, :string
    remove_column :aps, :switch_ip, :string
  end
end
