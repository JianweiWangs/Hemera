require 'open3'
module Hemera
  module Xcode
    def self.open(path)
      xcodeproj_relative_path = "#{path}/*.xcworkspace"
      xcodeproj_relative_path = "#{path}/*.xcodeproj" unless Dir.glob(xcodeproj_relative_path).any?
      system "open #{xcodeproj_relative_path}"
    end
    def self.clean
      path_command = 'defaults read ~/Library/Preferences/com.apple.dt.Xcode.plist IDECustomDerivedDataLocation'
      Open3.popen3(path_command) { |_, stdout, _, _|
        path = stdout.read.to_s.split("\n")[0]
        func = 'rm -rf'
        path = '~/Library/Developer/Xcode/DerivedData' unless File.exist? path
        command = "#{func} #{path}"
        puts "#{path} Cleaning"
        system command
        puts "Clean Complete"
      }
    end
  end
end