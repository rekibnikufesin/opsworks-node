execute 'add nodejs repo' do
  command 'curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -'
end

yum_package 'nodejs'
package ['gcc-c++', 'make']
yum_package 'ImageMagick'

execute 'install pm2' do
  command 'npm install pm2 -g'
end

instance = search("aws_opsworks_instance", "self:true").first # this gets the databag for the instance
layers = instance['role'] # the attribute formerly known as 'layers' via opsworks is now found as role in the opsworks instance

if layers.include?("api-layer")
    Chef::Log.info("** setting container to api")
    execute 'set api env var' do
      command 'export CONTAINER=api'
    end
elsif layers.include?("web-layer")
    Chef::Log.info("** setting container to web")
    execute 'set api env var' do
      command 'export CONTAINER=web'
    end
else
    Chef::Log.info("** setting container to unknown")
    execute 'set api env var' do
      command 'export CONTAINER=unknown'
    end
end
execute 'check env' do
  command 'echo $CONTAINER'
end
