$: << File.expand_path(File.dirname(__FILE__)) + "/../lib"
require 'htaccess_dsl'
include HtaccessDsl

describe Htaccess do
  context 'DSL given { Foo "Bar Baz" }' do
    subject do
      dsl {
        Foo "Bar Baz"
      }
    end

    its(:to_ary) { should == ["Foo Bar Baz"] }
  end

  context 'DSL given { Foo "Bar Baz"; Hoge "Fuga Piyo" }' do
    subject do
      dsl {
        Foo  "Bar Baz"
        Hoge "Fuga Piyo"
      }
    end

    its(:to_ary) { should == ["Foo Bar Baz", "Hoge Fuga Piyo"] }
  end

  context 'DSL given { Foo { Hoge "Fuga Piyo" } }' do
    subject do
      dsl {
        Foo {
          Hoge "Fuga Piyo"
        }
      }
    end

    its(:to_ary) { should == ["<Foo>", ["Hoge Fuga Piyo"], "</Foo>"] }
  end

  context 'DSL given { Foo("Bar") { Hoge "Fuga Piyo" } }' do
    subject do
      dsl {
        Foo("Bar") {
          Hoge "Fuga Piyo"
        }
      }
    end

    its(:to_ary) { should == ["<Foo Bar>", ["Hoge Fuga Piyo"], "</Foo>"] }
  end

  context 'DSL given { Foo { Bar { Hoge "Fuga Piyo" } } }' do
    subject do
      dsl {
        Foo {
          Bar {
            Hoge "Fuga Piyo"
          }
        }
      }
    end

    its(:to_ary) { should == ["<Foo>", ["<Bar>", ["Hoge Fuga Piyo"], "</Bar>"], "</Foo>"] }
  end
end
