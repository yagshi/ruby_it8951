# frozen_string_literal: true

require_relative "ruby_it8951/version"
require 'ffi'

module RubyIt8951
  class Error < StandardError; end
  extend FFI::Library
  ffi_lib :it8951
  attach_function :it8951_init, [], :void
  attach_function :it8951_display_area, [:int, :int, :int, :int, :int], :void
end
