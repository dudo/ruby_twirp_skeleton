# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'hanami/setup'

require_relative '../lib/my_service'

Hanami.configure do
  model do
    ##
    # Database adapter
    #
    # Available options:
    #
    #  * SQL adapter
    #    adapter :sql, 'sqlite://db/my_service_development.sqlite3'
    #    adapter :sql, 'postgresql://localhost/my_service_development'
    #    adapter :sql, 'mysql://localhost/my_service_development'
    #
    adapter :sql, ENV.fetch('DATABASE_URL')

    ##
    # Migrations
    #
    migrations 'db/migrations'
    schema     'db/schema.sql'
  end

  environment :development do
    # See: https://guides.hanamirb.org/projects/logging
    logger level: :debug
  end

  environment :production do
    logger level: :info, formatter: :json, filter: []
  end
end
