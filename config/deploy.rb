set :application, 'blaznive_komedie'
set :repo_url,    'git@bitbucket.org:masa331/blaznive_komedie.git'
set :deploy_to,   '/var/www/blaznive_komedie'
set :pty, true
set :linked_files, %w{config/database.yml config/smtp_settings.yml}
set :linked_dirs,  %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :rails_env, 'production'
set :stage,     :production

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  task :prepare_sitemaps do
    on roles(:app) do
      execute :mkdir, '-p', "#{shared_path}/sitemaps"
      execute :rm, '-rf', "#{release_path}/public/sitemaps"
      execute :ln, '-s', "#{shared_path}/sitemaps #{release_path}/public/sitemaps"
      execute :rake, 'sitemap:generate'
    end
  end

  after :publishing, :restart
end
