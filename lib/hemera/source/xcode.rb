require 'open3'
module Hemera
  module Xcode
    def self.open(path)
      xcodeproj_relative_path = "#{path}/*.xcworkspace"
      xcodeproj_relative_path = "#{path}/*.xcodeproj" unless Dir.glob(xcodeproj_relative_path).any?
      system "open #{xcodeproj_relative_path}"
    end

    def self.clean
      puts 'In order to clean complete，xcode will be quit'
      `osascript -e 'quit app "Xcode"'`
      path_command = 'defaults read ~/Library/Preferences/com.apple.dt.Xcode.plist IDECustomDerivedDataLocation'
      Open3.popen3 path_command do |_, stdout, _, wait_thr|
        path = wait_thr.value.success? ? stdout.read.to_s.split("\n")[0] : '~/Library/Developer/Xcode/DerivedData'
        func = 'rm -rf'
        command = "#{func} #{path}"
        puts "#{path} cleaning, wait a moment please 😄"
        system command
        puts "Clean complete, 👍"
      end
    end
  end
end