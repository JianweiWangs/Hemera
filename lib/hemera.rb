require 'hemera/version'
require 'gli'

include GLI::App
program_desc 'Hemera, a command line tool for development'
version Hemera::VERSION

require 'hemera/command/xcode'
require 'hemera/command/pod'
require 'hemera/command/meta'
run(ARGV)