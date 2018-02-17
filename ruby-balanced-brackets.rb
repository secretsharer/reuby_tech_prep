class BracketChecker
  def initialize(bracket_string)
    @chars = bracket_string.chars
    @stack = []
    @map = { '{' => '}', '(' => ')', '[' => ']' }
    @flag = 'YES'
  end

  def run
    @chars.each do |char|
      @stack.unshift(char) if opening_bracket?(char)
      compare_closing(char) if closing_bracket?(char)
    end
    @flag = 'NO' if !@stack.empty? # stack has to be empty too!
    puts @flag
  end

  private

  def opening_bracket?(char)
    @map.keys.include?(char)
  end

  def closing_bracket?(char)
    @map.values.include?(char)
  end

  def compare_closing(char)
    @flag = "NO" if @stack.empty?
    @flag = "NO" if @map[@stack.shift] != char
  end
end
