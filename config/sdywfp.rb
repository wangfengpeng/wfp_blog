# config valid only for current version of Capistrano
lock "3.8.2"

set :application, "wfp_blog"
set :repo_url, "https://github.com/wangfengpeng/wfp_blog.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "backup"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 10

set :ssh_options, {
  keys: %w(~/.ssh/id_rsa),
  forward_agent: true,
  auth_methods: %w(publickey)
}

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.2.3'

set :whenever_environment, fetch(:stage)
set :whenever_variables, -> do
  "'environment=#{fetch :whenever_environment}" \
  "&rbenv_root=#{fetch :rbenv_path}'"
end
