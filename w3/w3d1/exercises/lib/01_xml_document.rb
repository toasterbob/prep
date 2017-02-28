class XmlDocument
  def initialize(indent = false)
    @indent = indent
    @indent_depth = 0
  end

  def method_missing(method_name, *args, &blk)
    if block_given?
      result = "#{tabspace}<#{method_name}>#{newline}"
      indent
      result << "#{blk.call}"
      unindent
      result << "#{tabspace}</#{method_name}>#{newline}"
    else
      if args.first.nil?
        result = "#{tabspace}<#{method_name}/>#{newline}"
      elsif args.first
        hash = args.first.map { |key, value| "#{key}=\"#{value}\""}
        result = "#{tabspace}<#{method_name} #{hash.join("")}/>#{newline}"
      end
    end
    result
  end

  private
  attr_reader :indent_depth

  def indent
    @indent_depth += 1 if @indent
  end

  def unindent
    @indent_depth -= 1 if @indent
  end

  def newline
    @indent ? "\n" : ""
  end

  def tabspace
    "  " * @indent_depth
  end


end
