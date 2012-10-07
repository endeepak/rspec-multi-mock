require File.dirname(__FILE__) + '/spec_helper'

describe MultiMock::Adapter do
  context "with mocha" do
    it "should return the stubbed value" do
      Object.expects(:hello).returns("Hello Mocha")

      Object.hello.should == "Hello Mocha"
    end

    it "should verify the proxied expectation" do
      stub(Mocha::Mockery.instance).verify #This is to make sure mocha does not verify expecteations at the end of this spec
      Object.expects(:hello).never
       begin
         Object.hello
         fail "Expected to raise Mocha::ExpectationError"
       rescue Mocha::ExpectationError
       end
    end

    it "is setting up data for next spec" do
      Object.stubs(:stubbed_method).returns("Hello Mocha")
      Object.stubbed_method
    end

    it "should clear the stubs created in previous specs" do
      lambda { Object.stubbed_method }.should raise_error(NoMethodError)
    end
  end

  context "with ::NotAMock::RspecMockFrameworkAdapter" do
    it "should return the stubbed value" do
      Object.stub_method(:hello => "Hello Not A Mock")

      Object.hello.should == "Hello Not A Mock"
    end

    it "should verify the proxied expectation" do
      Object.stub_method(:hello) {}

      Object.hello

      Object.should have_received(:hello)
    end

    it "is setting up data for next spec" do
      Object.stub_method(:stubbed_method) {}
      Object.stubbed_method
    end

    it "should clear the stubs created in previous specs" do
      lambda { Object.stubbed_method }.should raise_error(NoMethodError)
    end
  end

  context "with rr" do
    it "should return the stubbed value" do
      stub(Object).hello { "Hello RR" }

      Object.hello.should == "Hello RR"
    end

    it "should verify the proxied expectation" do
      dont_allow(Object).hello

      lambda { Object.hello }.should raise_error(RR::Errors::TimesCalledError)
    end

    it "is setting up data for next spec" do
      stub(Object).stubbed_method {}
      Object.stubbed_method
    end

    it "should clear the stubs created in previous specs" do
      lambda { Object.stubbed_method }.should raise_error(NoMethodError)
    end
  end

  context "with rspec mock" do
    it "should return the stubbed value" do
      Object.should_receive(:hello).and_return("Hello RSpec mock")

      Object.hello.should == "Hello RSpec mock"
    end

    it "should verify the proxied expectation" do
      Object.should_receive(:hello).never

      lambda { Object.hello }.should raise_error(RSpec::Mocks::MockExpectationError)
    end

    it "is setting up data for next spec" do
      Object.should_receive(:stubbed_method).and_return("Hello Mocha")
      Object.stubbed_method
     end

    it "should clear the stubs created in previous specs" do
      lambda { Object.stubbed_method }.should raise_error(NoMethodError)
    end
  end
end