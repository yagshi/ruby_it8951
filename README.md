# ruby_it8951

## About

This gem is for [Waveshare Electronics](https://www.waveshare.com "Waveshare website")' IT-8951 controller based EPD (e-paper device) with Raspberry Pi. 

You can easily control EPD with simple code.

## Requirements

 - Native Library for Raspberry Pi [epd_it8950](https://github.com/yagshi/epd_it8951)
 
 - [FFI](https://github.com/ffi/ffi)

 - root privileges (It crashes if you're not root. :-p)

## Example

```Ruby
require 'ruby_it8951'

IT8951.init
info = IT8951.get_device_info  # => [width, height, addr, "fw ver", "lut ver"]
img = (0..15).inject([]){|a, i| a + [i * 16] * 100}
IT8951.transfer_image(20, 10, 100, 16, img)
IT8951.display_area(0, 0, info[0], info[1], 2)
```

