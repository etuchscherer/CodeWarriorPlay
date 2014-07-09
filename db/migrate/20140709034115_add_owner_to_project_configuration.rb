class AddOwnerToProjectConfiguration < ActiveRecord::Migration
  def change
    add_column :project_configurations, :owner, :string
  end
end
