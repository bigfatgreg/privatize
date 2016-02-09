module Privatize

  class Pixelate < Image

    def initialize path, options={}
      super
    end

    def normalize n
      @percentage = n < 51 ? ((n*2)/100.0)*10 : 10 + 25 * ((n-50)/49.0)
    end

    def process! level=nil
      tiny = level || 50 
      MiniMagick::Tool::Convert.new do |convert|
        convert.scale("#{normalize(100 - tiny.to_i)}%")
        convert.scale("#{info['width']}x#{info['height']}!")
        convert << @path
        convert << output_path(tiny)
      end
    end

  end

end