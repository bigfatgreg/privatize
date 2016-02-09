module Privatize

  class Image
  
    attr_reader :path, :output
  
    def initialize path, options={}
      @path = path
      @output = options[:output] || nil
    end

    class << self
      def effects
        klasses = ObjectSpace.each_object(Class).select { |klass| klass < self }
        klasses.map {|e| e.to_s.split('::').last.downcase }     
      end
    end
    
    def image
      @image ||= MiniMagick::Image.new(@path)
    end

    def info
      @info ||= MiniMagick::Image::Info.new(@path)
      %w{format width height size human_size}.inject({}) { |r,x| r.update(x => @info.cheap_info(x)) }
    end
    
    def filename
      File.basename(@path, ".*")
    end
    
    def ext
      File.extname(@path)
    end
    
    def dirname
      File.dirname(@path)
    end
    
    def output_path method
      @output = Pathname.new(@output).directory? ? "#{@output}/#{filename}_#{method}_#{Time.now.to_i}#{ext}" : @output
      @output || "#{dirname}/#{filename}_#{method}_#{Time.now.to_i}#{ext}"
    end

    private
        
    def dir
      @dir ||= Dir.mktmpdir
    end
  
  end
  
end