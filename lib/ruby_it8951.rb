# frozen_string_literal: true

require_relative "ruby_it8951/version"
require 'ffi'

module IT8951
  class Error < StandardError; end

  class DeviceInfo < FFI::Struct
    layout(:panelW, :uint16, :panelH, :uint16,
           :imgBufAddrL, :uint16, :imgBufAddrH, :uint16,
           :fwVersion, [:uint8, 16],
           :lutVersion, [:uint8, 16]
          )
  end
  # private module
  module IT8951_P
    extend FFI::Library
    ffi_lib :it8951
    attach_function :get_device_info, :it8951_get_device_info, [], DeviceInfo.by_value
    attach_function :transfer_image, :it8951_transfer_image, [:int, :int, :int, :int, :pointer], :void
  end
  

  extend FFI::Library
  ffi_lib :it8951
  attach_function :init, :it8951_init, [], :int
  attach_function :display_area, :it8951_display_area, [:int, :int, :int, :int, :int], :void

  def get_device_info
    d = IT8951_P.get_device_info
    [d[:panelW], d[:panelH], d[:imgBufAddrL] + d[:imgBufAddrH] * 256, d[:fwVersion].to_s, d[:lutVersion].to_s]
  end

  def transfer_image(x, y, w, h, data)
    FFI::MemoryPointer.new(:uint8, data.length) do |p|
      p.write_array_of_uint8(data)
      IT8951_P.transfer_image(x, y, w, h, p)
    end
  end
  
  module_function :get_device_info
  module_function :transfer_image
end
