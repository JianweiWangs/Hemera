require 'hemera/source/xcode'

desc 'Xcode'
command :xcode, :x do |c|
  c.desc 'Open Xcode Workspace'
  c.command :o, :open do |com|
    com.action do |_global_options, _options, _args|
      Hemera::Xcode.open '.'
    end
  end

  c.desc 'Clean DerivedData: support custom path'
  c.command :c, :clean do |com|
    com.action do |_global_options, _options, _args|
      Hemera::Xcode.clean
    end
  end
end