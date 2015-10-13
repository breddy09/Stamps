include Stamps
include Stamps::Browser
include Batch
include Log4r
include RSpec
include RSpec::Matchers
include DataMagic

#log Stamps.os

Before do  |scenario|
  log_step "#{scenario.name} :: BEGIN"
  #setup
end

After do |scenario|
  log_step "#{scenario.name} :: END"
  teardown
  $start = false
end
