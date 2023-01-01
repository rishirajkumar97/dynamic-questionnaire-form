# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes' do
  it 'should match all the previous routes' do
    failure_message = "Do not panic! Root cause for this error might be intentional change in routes. \n" \
                      "Your best bet is to execute `bundle exec rake route_snapshot:update` in the command line. \n" \
                      'Review the changes made to routes_snapshot.txt and if the change is intentional commit file ' \
                      'to the source control.'

    current_routes = `rails routes RAILS_ENV='test' | grep -v "^\s*/assets"`
    previous_routes = File.read('spec/__routes__/routes_snapshot.txt')
    expect(previous_routes).to eq(current_routes), failure_message
  end
end
