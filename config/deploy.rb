# capistranoのバージョン固定
lock '3.14.1'

# デプロイするアプリケーション名
set :application, 'Anicheck'

# cloneするgitのレポジトリ
set :repo_url, 'https://github.com/ryosakamoto39/Anicheck.git'

# deployするブランチ。デフォルトはmasterなのでなくても可。
set :branch, 'master'

# deploy先のディレクトリ。
set :deploy_to, '/var/www/Anicheck'

# シンボリックリンクをはるファイル。
set :linked_files, #%w{ config/secrets.yml }
#fetch(:linked_files, []).push('config/settings.yml')

# シンボリックリンクをはるフォルダ。
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# 保持するバージョンの個数
set :keep_releases, 2

# rubyのバージョン
set :rbenv_ruby, '2.6.3'

# 出力するログのレベル。
set :log_level, :debug

# AWSの環境変数を明示。
set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

#config/secrets.ymlを本番環境のshared/config/secrets.ymlに反映するための設定
  desc 'upload secrets.yml'
  task :upload do
    on roles(:app) do |host|
      if test "[ ! -d #{shared_path}/config ]"
        execute "mkdir -p #{shared_path}/config"
      end
      upload!('config/secrets.yml', "#{shared_path}/config/secrets.yml")
    end
  end
  before :starting, 'deploy:upload'
  after :finishing, 'deploy:cleanup'


  desc 'Create database'
  task :db_create do
    on roles(:db) do |_host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  desc 'Run seed'
  task :seed do
    on roles(:app) do
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end
