set :application,   "bucketread"
set :repository,    "git@github.com:nitindhar7/bucketread.git"
set :scm,           :git
set :scm_command,   "/home2/basedata/opt/bin/git"
set :local_scm_command, "git" 
set :user,          "basedata"
set :password,      "n5!GT@AB#dk"
set :keep_releases, 5
set :rake,          '/usr/bin/rake'
set :branch,        'master'
set :use_sudo,      false
set :deploy_to,     "~/#{application}"

role :app,          "basedataapp.com"
role :web,          "basedataapp.com"
role :db,           "basedataapp.com", :primary => true

default_run_options[:pty]   = true
ssh_options[:paranoid]      = false
ssh_options[:forward_agent] = true

desc "Add config symlinks"
task :custom_symlinks do
  run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
end

desc "update permissions for project"
task :update_project_permissions do
  run "chmod -R u=rwx,go=rx /home2/basedata/bucketread"
end

desc "updated permissions for fgci"
task :update_fcgi_permissions do
  run "chmod 0755 #{release_path}/public/dispatch.*"
end

after "deploy:update_code", "custom_symlinks"
after "custom_symlinks", "update_project_permissions"
after "update_project_permissions", "update_fcgi_permissions"