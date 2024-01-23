def evaluate(expression)
  stack = []
  precedence = { '+' => 1, '-' => 1, '*' => 2, '/' => 2 }

  chars = expression.chars.select { |c| c != ' '}
  number = ''
  tokens = []
  chars.each do |c|
    if c.match?(/\d/)
      number << c
    else
      tokens << number if !number.empty?
      number = ''
      tokens << c
    end
  end

  puts "Tokens - #{tokens.inspect}"

  tokens.each do |token|
    if token.match?(/\d+(\.\d+)?/)
      stack.push(token.to_f)
    elsif token.match?(/[-+\*\/]/)
      while stack.length >= 2 && precedence[stack[-1]] >= precedence[token]
        operator = stack.pop
        operand2 = stack.pop
        operand1 = stack.pop
        result = perform_operation(operand1, operand2, operator)
        stack.push(result)
      end
      stack.push(token)
    elsif token == '('
      stack.push(token)
    elsif token == ')'
      while stack[-1] != '('
        operator = stack.pop
        operand2 = stack.pop
        operand1 = stack.pop
        result = perform_operation(operand1, operand2, operator)
        stack.push(result)
      end
      stack.pop
    end
  end

  while stack.length >= 3
    operator = stack.pop
    operand2 = stack.pop
    operand1 = stack.pop
    result = perform_operation(operand1, operand2, operator)
    stack.push(result)
  end

  stack.first
end

def perform_operation(operand1, operand2, operator)
  case operator
  when '+'
    operand1 + operand2
  when '-'
    operand1 - operand2
  when '*'
    operand1 * operand2
  when '/'
    operand1 / operand2
  end
end

# Example usage:
expression = "1 + 2 * (3 - 4) / 2"
result = evaluate(expression)
puts "Result: #{result}"
