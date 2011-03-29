HtaccessDsl
===========

A DSL to write .htaccess files with Ruby.

Example
-------

    dsl {
      IfModule("mod_rewrite.c") {
        RewriteEngine :on
        Limit("GET") {
          RewriteRule "^/user/(.*)$ /user.cgi?id=$1 [L,R]"
        }
      } 

      Order "Deny,Allow"
      Deny  "from All"
      (11..15).each do |n|
        Allow "from 192.168.0.#{n.to_s}"
      end
    }

Example's Output
----------------

    <IfModule mod_rewrite.c>
      RewriteEngine on
      <Limit GET>
        RewriteRule ^/user/(.*)$ /user.cgi?id=$1 [L,R]
      </Limit>
    </IfModule>
    Order Deny,Allow
    Deny from All
    Allow from 192.168.0.11
    Allow from 192.168.0.12
    Allow from 192.168.0.13
    Allow from 192.168.0.14
    Allow from 192.168.0.15
