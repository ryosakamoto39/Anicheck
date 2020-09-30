# EC2サーバーのIP、EC2サーバーにログインするユーザー名、サーバーのロールを記述
server '18.180.139.105', user: 'ryosakamoto39', roles: %w[app db web]

# デプロイするサーバーにsshログインする鍵の情報を記述
set :ssh_options, keys: '~/.ssh/Anicheck_key_rsa'
