require 'rubygems'
require 'active_record'
require 'erb'

database_configuration_file = File.join(APPLICATION_ROOT, 'config', 'database.yml')
if File.exists?(database_configuration_file)
  database_configuration = YAML::load(ERB.new(IO.read(database_configuration_file)).result)
  ActiveRecord::Base.establish_connection(database_configuration[RuGUI.configuration.environment])
end
