deploy 'private_repo' do
  repo 'https://github.com/rekibnikufesin/advanced_pm2.git'
  migrate false
  keep_releases 5
   symlink_before_migrate({})
  restart_command "cd /srv/www/app/current && npm install && pm2 startOrRestart ecosystem.json"
  user 'root'
  deploy_to '/srv/www/app'
  action :deploy
end
