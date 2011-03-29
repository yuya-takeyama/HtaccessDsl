$: << File.expand_path(File.dirname(__FILE__)) + "/../lib"
require 'htaccess_dsl'
include HtaccessDsl

describe Htaccess do
  context 'DSL given { Foo "Bar Baz" }' do
    subject { dsl { Foo "Bar Baz" } }

    its(:to_ary) { should == ["Foo Bar Baz"] }
  end

  context 'DSL given { Foo "Bar Baz"; Hoge "Fuga Piyo" }' do
    subject {
      dsl {
        Foo  "Bar Baz"
        Hoge "Fuga Piyo"
      }
    }

    its(:to_ary) { should == ["Foo Bar Baz", "Hoge Fuga Piyo"] }
  end
end
