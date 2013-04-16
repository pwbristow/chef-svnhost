define :svnsite do
	s = params[:name]
        dir = File.join("/srv/sites", s)

        subversion dir do
                repository "file:///srv/svn/repo"
                revision "HEAD"
                action :checkout
                user "apache"
        end
        template File.join("/etc/nginx/sites-available", s) do
                action :create
                mode "0444"
                source "nginx.erb"
                variables({
                        :site => s
                })
        end
        nginx_site s
end
