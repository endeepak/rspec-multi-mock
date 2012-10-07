## rspec-multi-mock [![Build Status](https://travis-ci.org/endeepak/rspec-multi-mock.png)](https://travis-ci.org/endeepak/rspec-multi-mock)

Allows multiple mock frameworks to be in action in RSpec. This version is for rspec >=2.3.0.

For rspec 1.3.1 refer to [v0.1.0](https://github.com/endeepak/rspec-multi-mock/tree/v0.1.0)

## Installation

        gem install rspec-multi-mock

## Usage

If you are using bundler add the dependency in Gemfile

        gem 'rspec-multi-mock', :group => :test

Configure multi-mock for RSpec runner (Usually done in spec_helper.rb)

        RSpec.configure do |config|
          config.mock_with MultiMock::Adapter.for(:rspec, :mocha, :rr, :not_a_mock, ::NewMockFramework::RSpecAdapter)
        end

As shown above you can use a symbol for frameworks listed above. The usage of adapter module directly may not work completely if the adapter module contains any extensions methods to be used in specs. For instance RR rspec adapter includes both the adapter methods and the extension methods.

## When & How is this useful?

There are cases where you might have to use two different mocking in the same project(for a while). It could be because

* You are merging two big projects and they use different mocking frameworks for unit testing.
* You want to try a new mocking framework with cleaner syntax and some new features.

Since RSpec does not support multiple mocking frameworks, we might hesitate to pick up these tasks because

* There could be less time and it needs some effort to convert all the specs to use new mocking framework.
* The new mocking framework may not yet provide all the features available in the current mocking framework.

Using this gem you can

* Start moving specs incrementally to new framework
* Start using new framework for new specs. This will reduce the number of specs need to be converted at the end.
* Use both mocking frameworks till the new one provides all the required features.

Please note that using multiple mocking frameworks can create a lot of confusion in the team. So make sure that the end goal is to use single mocking framework(Your favorite one!). Use this gem only during the transition phase.

## Note

If you are already using multiple mock frameworks with just one mock framework configured in spec runner, the mocks may not be working completely as you expected.

* The expectations set using the un-configured mocking framework will not be verified.
* The methods mocked or stubbed using the un-configured mocking framework will not be cleaned up after the spec run is completed. This becomes a serious issue if it is a class method.

## Limitations

* RR ad Not-A-Mock can not be used together since both frameworks have different implementation of 'have_received' matcher. This is true for any two frameworks with similar interface and different implementations.