# Regression Test Automation Framework

## Quick Start

* Install Git
* Pull down the repository to your local computer (git clone)
* Get ruby setup.  
  * Windows: Install [Ruby 2.7.4](https://rubyinstaller.org/downloads/) 
  * OSX: Install [Ruby Version Manager (RVM)](https://rvm.io/rvm/install)
  * OSX: Install the appropriate version of Ruby using the version specific install command `rvm install ruby-X.X.X` Recommend 2.7.4
* `gem install bundler` if bundler is not already installed
* `bundle` to install required gems.  (You need to run this whenever pulling down this repo with new changes)
* `rspec spec/signup_spec.rb` to run a single test and verify it's working
* `rspec` to run all tests.

## Download and Install ChromeDriver

* You will need to put ChromeDriver in your PATH
  * [Download ChromeDriver](http://chromedriver.chromium.org/downloads) (choose the latest version)
    * Extract it to some directory, e.g., c:\utils\chromedriver on windows or /Users/your-user-name/PATH/ on mac.
    * Then add the directory to your computers `PATH`. Learn more about how to do that [here](https://gist.github.com/nex3/c395b2f8fd4b02068be37c961301caa7)

## Frameworks

### Page-Object

We're using the [page-object](https://github.com/cheezy/page-object) gem to wrap around watir-webdriver.  You can always drop down and use the watir browser object, but page-object provides some nice abstractions.

* [Elements](https://github.com/cheezy/page-object/wiki/Elements)
* [Simple DSL](https://github.com/cheezy/page-object/wiki/Simple-DSL)
* [Ajax Calls](https://github.com/cheezy/page-object/wiki/Ajax-Calls)

### Watir

An open source Ruby library for automating tests. Watir interacts with a browser the same way people do: clicking links, filling out forms and validating text. The docs and examples can be found [http://watir.com/](http://watir.com/). Most things you need to do will be handled using the page object methods (see above), but if you need the browser to do something specific that page objects can't do you can call it directly with `@browser.<command>`.

### faker

The [faker](https://github.com/stympy/faker) can be used to generate random fake data within tests.

### RSpec

* [RSpec Expectations syntax](https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers)

## Writing Tests

### Structure

* **lib/pages** contains objects that represent a page in ops.  Example: home_page.rb maps to the home page in EZ Contactor.
* **spec/** contains the tests

### Rules

1. A given lib/pages/whatever_page.rb file should map to a single web page.
1. Test in watir the absolute minimum that's required since these tests are slow and more brittle than hitting the database directly.

### Things to consider when writing tests

1. We've run into several scenarios where workflows are very similar or an abstraction could be made. We decided simplicity, readability, and accessibility are more valuable than conciseness in many cases. If you have a series of tests with a bunch of if conditions trying to determine what state the tests need to run, it's probably better to duplicate that test for each mode.
