include_recipe "iptables"
include_recipe "openssh::iptables"
include_recipe "selinux::disabled"
include_recipe "nginx"
include_recipe "apache2"
include_recipe "apache2::iptables"
include_recipe "apache2::mod_ssl"
include_recipe "subversion::server"

include_recipe "chef-rewind-cookbook"

rewind :template => "/etc/httpd/sites-available/subversion.conf" do
	source "svn.conf.erb"
	cookbook_name "svnhost"
end

template "/srv/svn/repo/hooks/post-commit" do
	action :create
	owner "apache"
	mode "0755"
	variables({
		:dev => "/srv/sites/dev.cheftest",
		:prod => "/srv/sites/cheftest"
	})
end
directory "/srv/sites" do
	owner "apache"
end

["cheftest", "dev.cheftest"].each { |s| 
	svnsite s
}

iptables_rule "port_nginx"
