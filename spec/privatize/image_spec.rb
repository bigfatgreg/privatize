require 'minitest_helper'

class TestPrivatize < Minitest::Spec

  describe "Privatize::Image" do

    before do
      @image = Privatize::Image.new('spec/files/test.gif')
    end

    it "initializes with a path to a file" do
      refute_nil @image.path
    end
    
    it "opens the image specifed by the path" do
      refute_nil @image.image
    end
        
    it "can create a tmp directory for operations" do
      assert_equal true, Dir.exists?(@image.send(:dir))
    end
    
    it "gets the base filename from the path" do
      assert_equal "test", @image.filename
    end

    it "gets the file extension from the path" do
      assert_equal ".gif", @image.ext
    end

    it "gets the working directory name from the path" do
      assert_equal "spec/files", @image.dirname
    end
    
    it "knows if the image/path supplied is invalid" do
      assert_raises RuntimeError do
        @image = Privatize::Image.new('spec/files/test_bad.gif')
        @image.info
      end
    end
      
  end

end
