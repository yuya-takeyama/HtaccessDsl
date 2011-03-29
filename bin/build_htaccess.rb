require 'htaccess_dsl'

include HtaccessDsl
Dir::chdir(Dir::pwd)
load ARGV[0]
