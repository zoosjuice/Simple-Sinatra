# Rakefile

require './app'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

module Rails
  def self.root
    File.dirname(__FILE__)
  end
end

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env
end