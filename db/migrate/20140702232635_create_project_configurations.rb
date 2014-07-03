class CreateProjectConfigurations < ActiveRecord::Migration
  def change
    create_table :project_configurations do |t|
      t.string :name
      t.string :source
      t.string :destination
      t.boolean :enabled

      t.timestamps
    end
  end
end
