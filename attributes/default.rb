default[:couchpotato][:user] = 'couchpotato'
default[:couchpotato][:group] = 'couchpotato'

default[:couchpotato][:install_dir] = '/srv/apps/couchpotato'
default[:couchpotato][:config_dir] = '/etc/couchpotato'

default[:couchpotato][:git_url] = 'https://github.com/CouchPotato/CouchPotatoServer.git'
default[:couchpotato][:git_ref] = 'master'

default[:couchpotato][:settings] = {
  api_key: 'api_key',
  blackhole_enabled: 1,
  directory: '/usr/data/downloads',
  ignored_words: '',
  imdb_automation_enabled: 1,
  imdb_automation_urls_use: 1,
  imdb_watchlist: 'http://rss.imdb.com/user/urxxx/watchlist',
  library: [],
  newznab_enabled: 1,
  nzbs_api_key: 'nzbz_api_key',
  password: 'encrypted-password',
  permission_file: '0755',
  permission_folder: '0755',
  plex_enabled: 0,
  port: 5000,
  preferred_words: '',
  rarbg_enabled: 0,
  rarbg_min_seeders: 0,
  renamer_cleanup: 0,
  renamer_enabled: 0,
  renamer_file_name: '<thename><cd>.<ext>',
  renamer_folder_name: '<namethe> (<year>)',
  renamer_foldersep: '',
  renamer_from: '',
  renamer_nfo_name: '<filename>.orig.<ext>',
  renamer_rename_nfo: 1,
  renamer_separator: '',
  renamer_to: '',
  sabnzbd_api_key: 'sabnzbd_api_key',
  sabnzbd_remove_complete: 0,
  sabnzbd_url: 'https://localhost:9090',
  searcher_preferred_method: 'nzb',
  subtitle_enabled: 0,
  subtitle_force: 0,
  subtitle_languages: '',
  ssl_cert: '',
  ssl_key: '',
  suggestion_enabled: 1,
  themoviedb_api_key: 'themoviedb_api_key',
  transmission_directory: '',
  transmission_enabled: 0,
  transmission_password: '',
  transmission_username: '',
  transmission_url: 'http://localhost:9091',
  twitter_access_token_key: nil,
  twitter_access_token_secret: nil,
  twitter_enabled: 0,
  twitter_username: nil,
  url_base: nil,
  username: 'username',
  webhook_enabled: 0,
  webhook_on_snatch: 0,
  webhook_url: nil
}
