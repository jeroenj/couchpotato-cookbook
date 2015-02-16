service 'couchpotato'

user node[:couchpotato][:user] do
  system true
  shell '/bin/bash'
  home node[:couchpotato][:install_dir]
end

app_dirs = [
  node[:couchpotato][:install_dir],
  node[:couchpotato][:config_dir]
]

app_dirs.each do |dir|
  directory dir do
    recursive true
    mode 0755
    owner node[:couchpotato][:user]
    group node[:couchpotato][:group]
  end
end

git node[:couchpotato][:install_dir] do
  repository node[:couchpotato][:git_url]
  reference node[:couchpotato][:git_ref]
  action :checkout
  checkout_branch(node[:sickbeard][:git_ref]) unless node[:sickbeard][:git_ref] == 'master'
  enable_checkout node[:sickbeard][:git_ref] != 'master'
  user node[:couchpotato][:user]
  group node[:couchpotato][:group]
  notifies :restart, 'service[couchpotato]'
end

template ::File.join(node[:couchpotato][:config_dir], 'settings.conf') do
  source 'settings.conf.erb'
  owner node[:couchpotato][:user]
  group node[:couchpotato][:group]
  variables(
    api_key: node[:couchpotato][:settings][:api_key],
    directory: node[:couchpotato][:settings][:directory],
    ignored_words: node[:couchpotato][:settings][:ignored_words],
    imdb_watchlist: node[:couchpotato][:settings][:imdb_watchlist],
    library: node[:couchpotato][:settings][:library],
    nzbs_api_key: node[:couchpotato][:settings][:nzbs_api_key],
    password: node[:couchpotato][:settings][:password],
    port: node[:couchpotato][:settings][:port],
    preferred_words: node[:couchpotato][:settings][:preferred_words],
    sabnzbd_api_key: node[:couchpotato][:settings][:sabnzbd_api_key],
    sabnzbd_url: node[:couchpotato][:settings][:sabnzbd_url],
    sabnzbd_ssl: node[:couchpotato][:settings][:sabnzbd_ssl],
    ssl_cert: node[:couchpotato][:settings][:ssl_cert],
    ssl_key: node[:couchpotato][:settings][:ssl_key],
    themoviedb_api_key: node[:couchpotato][:settings][:themoviedb_api_key],
    transmission_url: node[:couchpotato][:settings][:transmission_url],
    twitter_access_token_key: node[:couchpotato][:settings][:twitter_access_token_key],
    twitter_access_token_secret: node[:couchpotato][:settings][:twitter_access_token_secret],
    twitter_username: node[:couchpotato][:settings][:twitter_username],
    username: node[:couchpotato][:settings][:username]
  )
  notifies :restart, 'service[couchpotato]'
end

link '/etc/init.d/couchpotato' do
  to ::File.join(node[:couchpotato][:install_dir], 'init/ubuntu')
  notifies :run, 'execute[couchpotato rc.d]'
end

template '/etc/default/couchpotato' do
  source 'default.erb'
  variables(
    user: node[:couchpotato][:user],
    home: node[:couchpotato][:install_dir],
    data: node[:couchpotato][:config_dir]
  )
  notifies :restart, 'service[couchpotato]'
end

execute 'couchpotato rc.d' do
  command 'update-rc.d couchpotato defaults'
  not_if { 'update-rc.d -n couchpotato defaults | grep "already existd"' }
end