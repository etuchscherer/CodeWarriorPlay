json.array!(@project_configurations) do |project_configuration|
  json.extract! project_configuration, :id, :name, :source, :destination, :enabled
  json.url project_configuration_url(project_configuration, format: :json)
end
