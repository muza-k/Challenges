# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  stack = []
  tokens.each do |t|
    if t == '+' || t== '-' || t == '*' || t == '/'
      op2 = stack.pop()
      op1 = stack.pop()
      if t == '+'
        stack.push(op1.to_i + op2.to_i)
      elsif t == '-'
        stack.push(op1.to_i - op2.to_i)
      elsif t == '*'
        stack.push(op1.to_i * op2.to_i)
      elsif t == '/'
        neg_sign = false
        neg_sign = !neg_sign if op2.to_i < 0
        neg_sign = !neg_sign if op1.to_i < 0

        res = (op1.to_i.abs / op2.to_i.abs).round
        res = res * -1 if neg_sign
        stack.push(res)
      end
    else
      stack.push(t)
    end
  end
  stack.first
end

tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
tokens = ["4","13","5","/","+"]
puts eval_rpn(tokens)