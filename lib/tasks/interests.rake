require File.join(File.dirname(__FILE__), '../../config/environment')
require 'database_cleaner'

namespace :interests do

  task :delete do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  task :load => :environment do
    require File.join(File.dirname(__FILE__), '../../db/interests.rb')
  end

  task :reload do
    Rake::Task['interests:data:delete'].invoke
    Rake::Task['interests:data:load'].invoke
  end

end