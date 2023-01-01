# frozen_string_literal: true

# The tech design is here: https://wiki.ucern.com/pages/viewpage.action?pageId=1694149064
namespace :route_snapshot do
  desc 'Updates snapshot file for all routes'
  task update: :environment do
    current_routes = `bundle exec rails routes RAILS_ENV='test' -g "^[^\s*/assets]"`
    File.open('spec/__routes__/routes_snapshot.txt', 'w+') do |snapshot|
      snapshot.write(current_routes)
    end
    puts 'spec/__routes__/routes_snapshot.txt updated'
  end
end
