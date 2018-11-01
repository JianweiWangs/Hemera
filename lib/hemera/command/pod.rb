
desc 'cocoapods'

command :pod, :p do |c|
  c.desc 'create a pod'
  c.command :create, :c do |command|
    command.action do |_global_options, _options, args|
      system "pod lib create --template-url=https://github.com/JianweiWangs/pod-template.git #{args[0]}"
    end
  end

  c.desc 'force install'
  c.command :install, :i do |command|
    command.action do |_global_options, _options, _args|
      system 'rm -rf Podfile.lock && pod install'
    end
  end
end