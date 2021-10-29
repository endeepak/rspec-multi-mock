require File.dirname(__FILE__) + '/spec_helper'

describe MultiMock::Adapter do
  context "with mocha" do
    it "should return the stubbed value" do
      Object.expects(:hello).returns("Hello Mocha")

      expect(Object.hello).to eq "Hello Mocha"
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
      expect { Object.stubbed_method }.to raise_error(NoMethodError)
    end

    it "should allow using mocks" do
      test_mock = mock
      test_mock.expects(:hello).returns("Hello Mocha")

      expect(test_mock.hello).to eq "Hello Mocha"
    end
  end

  context "with rr" do
    it "should return the stubbed value" do
      stub(Object).hello { "Hello RR" }

      expect(Object.hello).to eq "Hello RR"
    end

    it "should verify the proxied expectation" do
      dont_allow(Object).hello

      expect { Object.hello }.to raise_error(RR::Errors::TimesCalledError)
    end

    it "is setting up data for next spec" do
      stub(Object).stubbed_method {}
      Object.stubbed_method
    end

    it "should clear the stubs created in previous specs" do
      expect { Object.stubbed_method }.to raise_error(NoMethodError)
    end
  end

  context "with rspec mock" do
    it "should return the stubbed value" do
      allow(Object).to receive(:hello).and_return("Hello RSpec mock")

      expect(Object.hello).to eq "Hello RSpec mock"
    end

    it "should verify the proxied expectation" do
      expect(Object).to receive(:hello)

      expect { Object.hello }.not_to raise_error
    end

    it "is setting up data for next spec" do
      allow(Object).to receive(:stubbed_method).and_return("Hello RSpec mock")
      Object.stubbed_method
     end

    it "should clear the stubs created in previous specs" do
      expect { Object.stubbed_method }.to raise_error(NoMethodError)
    end
  end
end
