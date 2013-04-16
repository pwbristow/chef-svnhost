class SVNHostSpec < MiniTest::Chef::Spec
  describe 'svnhost::testing' do
    it "must work" do
      %x{curl -H "Host: cheftest" -w "%{http_code}" localhost/file -o /dev/null -s}.must_equal "404"  
      %x{echo "foobar" | curl -o /dev/null -skT- https://subversion:subversion@localhost:8443/repo/file -w "%{http_code}" }.must_equal "201"
      %x{curl -H "Host: dev.cheftest" -w "%{http_code}" localhost/file -o /dev/null -s}.must_equal "200"  
      %x{curl -H "Host: cheftest" -w "%{http_code}" localhost/file -o /dev/null -s}.must_equal "404"
      %x{echo "foobar" | curl -o /dev/null -skT- https://subversion:subversion@localhost:8443/repo/changelog -w "%{http_code}"}.must_equal "201"
      %x{curl -H "Host: cheftest" -w "%{http_code}" localhost/file -o /dev/null -s}.must_equal "200"
    end
  end
end
