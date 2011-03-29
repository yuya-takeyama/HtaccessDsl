module HtaccessDsl
  class Htaccess
    def initialize
      @lines = []
      @depth = 0
    end

    def method_missing(method, *args, &block)
      if block_given?
        _put_block(method, *args, &block)
      else
        _puts(method.to_s + " " + args[0].to_s)
      end
    end

    # ディレクティブの指定
    def _puts(line)
      @lines << line
    end

    # ブロック形式の記述
    def _put_block(directive, cond = nil, &block)
      if cond.nil?
        @lines << "<#{directive.to_s}>"
      else
        @lines << "<#{directive.to_s} #{cond}>"
      end
      @depth += 1
      @lines << self.dsl(&block).to_ary
      @depth -= 1
      @lines << "</#{directive.to_s}>"
    end

    def to_ary
      @lines
    end
  end

  # 渡されたブロックを DSL として解釈し, Htaccess オブジェクトを返す.
  def dsl(&block)
    htaccess = Htaccess.new
    htaccess.instance_eval(&block)
    htaccess
  end
end
