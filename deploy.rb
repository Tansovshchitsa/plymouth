#encoding:utf-8
require 'net/ssh'

Net::SSH.start('61.157.96.183', 'ycxxww', :password => "ww880220") do |ssh|
    puts "开始部署!"
    ssh.open_channel do |channel|
        channel.exec("cd /home/ycxxww/sps && git pull ") do |ch, success|
          puts "部署成功!" if success
        end
    end
end
