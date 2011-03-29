$: << File.expand_path(File.dirname(__FILE__)) + "/../lib"
require 'htaccess_dsl'

include HtaccessDsl
Dir::chdir(Dir::pwd)
load ARGV[0]
