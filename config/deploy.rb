# config valid for current version and patch releases of Capistrano
lock "~> 3.13.0"

#set :rvm1_map_bins, %w{rake gem bundle ruby}


set :application, "xiaopang"
set :repo_url, "git@github.com:suxiaohun/xiaopang.git"

set :rails_env, "production"
set :unicorn_pid, -> { File.join(current_path, "tmp", "pids", "unicorn.pid") }
set :unicorn_config_path, -> { File.join(current_path, "config", "unicorn.rb") }
set :unicorn_roles, -> { :app }
set :unicorn_options, -> { "" }
set :unicorn_restart_sleep_time, 3
ask :deploy_option, 'simple'


set :rvm_ruby_version, '2.6.5' # Defaults to: 'default'
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/xiaopang"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/master.key"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system",'app/assets/videos', "public/packs", "node_modules"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


#namespace :yarn do
#  task :install do
#    # Someone decided to install yarn every time asset:precompile is called for some strange reason.
#    # It's less then optimal - as it prevents us from doing it in a separate step during deploy with specific options.
#    # So we clear the old task and override it with an empty one.
#  end
#end


#if Rake::Task.task_defined?("deploy:compile_assets")
#  binding.pry
#  #Rake::Task["yarn:install"].clear
#  puts "....defined"
#else
#  binding.pry
#  puts ".....not defined"
#end

namespace :xiaosu do
  desc 'link books directory'
  task :link_books do
    on roles(:all) do
      within release_path do
        puts_front "start link books..."
        execute :ln, '-s', "/home/crystal/books public/"
        puts_end
      end
    end
  end


  desc 'init books'
  task :init_books do
    on roles(:all) do
      within release_path do
        puts_front "start init books..."
        execute :rake, 'book:init', "RAILS_ENV=production"
        puts_end
      end
    end
  end

  desc 'init yys'
  task :init_yys do
    on roles(:all) do
      within release_path do
        puts_front "init yys data..."
        execute :rake, 'yys:init', 'RAILS_ENV=production'
        puts_end
      end
    end
  end


end


namespace :unicorn do
  desc "Start Unicorn"
  task :start do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        if test("[ -e #{fetch(:unicorn_pid)} ] && kill -0 #{pid}")
          info "unicorn is running..."
        else
          with rails_env: fetch(:rails_env) do
            execute :bundle, "exec unicorn", "-c", fetch(:unicorn_config_path), "-E", fetch(:rails_env), "-D", fetch(:unicorn_options)
          end
        end
      end
    end
  end

  desc "Restart Unicorn (USR2); use this when preload_app: true"
  task :restart do
    invoke "unicorn:start"
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        info "unicorn restarting..."
        execute :kill, "-s USR2", pid
      end
    end
  end


  desc "Legacy Restart (USR2 + QUIT); use this when preload_app: true and oldbin pid needs cleanup"
  task :legacy_restart do
    invoke "unicorn:restart"
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        execute :sleep, fetch(:unicorn_restart_sleep_time)
        if test("[ -e #{fetch(:unicorn_pid)}.oldbin ]")
          execute :kill, "-s QUIT", pid_oldbin
        end
      end
    end
  end

end

def pid
  "`cat #{fetch(:unicorn_pid)}`"
end

def pid_oldbin
  "`cat #{fetch(:unicorn_pid)}.oldbin`"
end


def puts_front(str)
  puts
  puts '+----------------------------------------------------------------------------------------+'
  puts '|                                                                                        |'
  puts '|                                                                                        |'
  puts "\e[48;5;34m\033[5m #{str} \e[0m"

end

def puts_end
  puts '|                                                                                        |'
  puts '|                                                                                        |'
  puts '+----------------------------------------------------------------------------------------+'

  puts
end


after 'deploy:publishing', 'xiaosu:link_books'
deploy_option = fetch(:deploy_option)
unless deploy_option == 'simple'
  after 'deploy:publishing', 'xiaosu:init_books'
  after 'deploy:publishing', 'xiaosu:init_yys'
end

after 'deploy:publishing', 'deploy:restart'


namespace :deploy do
  task :restart do
    invoke 'unicorn:legacy_restart'
  end
end




