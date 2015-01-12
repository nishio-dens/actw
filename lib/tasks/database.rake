require 'bundler/setup'
require 'active_record'

namespace :db do
  task :apply do
    env = ENV['RAILS_ENV'] || 'development'
    rails_database = YAML.load("#{Rails.root}/config/database.yml")

    File.open("#{Rails.root}/config/dev_database.yml", "w") do |f|
      settings = rails_database[env]
        .merge(adapter: 'mysql')
        .merge(host: '127.0.0.1')
        .map { |k, v| "#{k}: #{v}" }
        .join("\n")
      f.puts(settings)
    end
  end

  task :overhaul do
    sh 'bundle exec rake db:drop db:create db:apply db:migrate db:seed'
  end
end
