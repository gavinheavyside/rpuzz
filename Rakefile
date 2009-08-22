require 'rubygems'
require 'cucumber/rake/task'
require 'spec/rake/spectask'

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty" # Any valid command line option can go here.
end

Spec::Rake::SpecTask.new do |t|
    t.warning = true
    t.rcov = true
  end