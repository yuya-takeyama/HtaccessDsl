puts dsl {
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
