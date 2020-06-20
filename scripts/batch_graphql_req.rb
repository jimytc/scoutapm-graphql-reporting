# frozen_string_literal: true

require 'typhoeus'
require 'securerandom'

require_relative './hosts'
require_relative './operations'
require_relative './new_operations'

def log(msg = '')
  puts msg
end

def make_request(key, query, target_host)
  log "[#{target_host}] Sending #{key.to_s}"
  response = Typhoeus.post(target_host, body: query)
  log "  Code #{response.code}: #{response.body}" unless response.success?
end

def iterate_operations(target_host, operations)
  log("Making request to #{target_host}")
  operations.each do |key, query|
    make_request(key, query, target_host)
    sleep 1
  end
  log
end

3.times do
  HOSTS.each { |host| iterate_operations(host, OPERATIONS) }
  sleep 10
end

sleep 60

3.times do
  HOSTS.each { |host| iterate_operations(host, NEW_OPERATIONS) }
  sleep 10
end
