# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)
load 'tasks/rubocop.rake'

task(:default).prerequisites << :rubocop
task(:default).prerequisites << :spec
