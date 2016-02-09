require 'minitest_helper'

class TestPrivatize < Minitest::Spec

  describe "Privatize::Pixelate" do

    before do
      @image = Privatize::Pixelate.new('spec/files/test.gif').process!
    end
  
    it "pixelates an image" do
      refute_empty Dir.glob('spec/files/test_*[0-9]*')
    end
  
    after do
      Dir.glob('spec/files/test_*[0-9]*').map { |v| FileUtils.remove_entry v }
    end

  end

end