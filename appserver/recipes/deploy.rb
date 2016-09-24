deploy 'private_repo' do
  repo 'https://github.com/rekibnikufesin/advanced_pm2.git'
  user 'root'
  deploy_to '/srv/www/app'
  action :deploy
end
