require 'hemera/source/meta'
require 'hemera/tool/log'
desc 'metaprogramming'
command :meta, :m do |c|
  c.desc 'generate img code'
  c.command :img, :i do |command|
    command.action do |_global_options, _options, args|
      if args.count == 1
        Hemera::Meta.generate(args[0])
      elsif args.count == 2
        Hemera::Meta.generate(args[0], args[1])
      else
        Hemera.log <<-LOG
只接受文件名及路径参数，路径参数不填默认在当前文件夹，不支持多文件夹路径
Usage:
  hm m i FileName         # 在当前目录及子目录查找所有 .png 图片，并在当前目录生成文件名对应代码文件
  hm m i FileName DirPath    # 在指定目录及子目录查找所有 .png 图片，并在当前目录生成文件名对应代码文件
        LOG
      end
    end
  end
end