# frozen_string_literal: true

require_relative "throw_here/version"
require_relative 'throw_here/cli'

require 'pry'

module ThrowHere
  class Error < StandardError; end
  # Your code goes here...
end
