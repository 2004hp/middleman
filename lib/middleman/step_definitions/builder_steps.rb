require 'fileutils'

Given /^app "([^\"]*)" is using config "([^\"]*)"$/ do |path, config_name|
  target = File.join(PROJECT_ROOT_PATH, "fixtures", path)
  config_path = File.join(target, "config-#{config_name}.rb")
  config_dest = File.join(current_dir, "config.rb")
  FileUtils.cp(config_path, config_dest)
end

Given /^a fixture app "([^\"]*)"$/ do |path|
  step %Q{a directory named "#{path}"}

  target_path = File.join(PROJECT_ROOT_PATH, "fixtures", path)
  FileUtils.cp_r(target_path, current_dir)
  
  step %Q{I cd to "#{path}"}
end

Given /^a built app at "([^\"]*)"$/ do |path|
  step %Q{a fixture app "#{path}"}
  step %Q{I run `middleman build`}
end

Given /^was successfully built$/ do
  step %Q{a directory named "build" should exist}
  step %Q{the exit status should be 0}
end

Given /^a successfully built app at "([^\"]*)"$/ do |path|
  step %Q{a built app at "#{path}"}
  step %Q{was successfully built}
end

Given /^a built app at "([^\"]*)" with flags "([^\"]*)"$/ do |path, flags|
  step %Q{a fixture app "#{path}"}
  step %Q{I run `middleman build #{flags}`}
end

Given /^a successfully built app at "([^\"]*)" with flags "([^\"]*)"$/ do |path, flags|
  step %Q{a built app at "#{path}" with flags "#{flags}"}
  step %Q{was successfully built}
end
