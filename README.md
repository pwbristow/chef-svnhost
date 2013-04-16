A simple recipe to learn a few chef techniques. It demos a subversion backed webhosting setup.
The idea is that a customer publishes their site to webdav backed by subversion rather than ftp,
as they would of previously. When support issues come in and the customer claims nothing has been
changed "it just broke" you have a greater chance of fixing things. You are given 2 sites cheftest and dev.cheftest
uploads to the webdav directory are immediately propogated to dev.cheftest. Only when the changelog is updated
do the changes get rolled out to the production site.
