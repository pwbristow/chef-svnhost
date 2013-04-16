name "svnhost"
maintainer "Pete Bristow"
maintainer_email "pb@z11.net"
license "Apache 2.0"
long_description "longer decription"
version "0.1"
recipe "svnhost", "sets up svnhost"

supports "centos"

[
  "apache2", "chef-rewind-cookbook", "iptables", "minitest-handler", "nginx", "openssh",
  "selinux", "subversion"
].each { |d|
	depends d
}
