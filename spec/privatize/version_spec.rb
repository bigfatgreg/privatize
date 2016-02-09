require 'minitest_helper'

class TestPrivatize < Minitest::Spec

  describe "Privatize::Version" do

    it "has a version number" do
      refute_nil ::Privatize::VERSION
    end
  
  end

end
