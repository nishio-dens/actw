require 'bundler/setup'
require 'active_record'

namespace :db do
  task :apply do
    env = ENV['RAILS_ENV'] || 'development'
    rails_database = YAML.load(File.open("#{Rails.root}/config/database.yml").read)

    File.open("#{Rails.root}/config/dev_database.yml", "w") do |f|
      settings = rails_database[env]
        .symbolize_keys
        .merge(adapter: 'mysql')
        .merge(host: '127.0.0.1')
        .map { |k, v| "#{k}: #{v}" }
        .join("\n")
      f.puts(settings)
    end
    sh 'bundle exec convergence -c ./config/dev_database.yml -i ./db/schema/actw.schema --apply'
  end

  task :overhaul do
    sh 'bundle exec rake db:drop db:create db:apply db:migrate db:seed'
  end
end
