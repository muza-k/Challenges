# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  pointer = 0
  lines = []
  increment_pointer = true

  s.each_char do |c|
    # add char to the line with pointer
    if lines[pointer]
      lines[pointer] << c
    else
      lines[pointer] = c
    end

    # based upon pointer position determine to increment or decrement pointer
    if pointer == num_rows-1 # 2 == 2
      increment_pointer = false
    end

    if pointer == 0
      increment_pointer = true
    end

    # if incrementing pointer
    if increment_pointer
      pointer = pointer + 1
    else
      pointer = pointer - 1
    end
  end #end of char loop


  # print result
  puts "------------ resut ----------"
  lines.each do |line|
    puts line.inspect
  end

  #return response
  lines.join("")
end

s = "PAYPALISHIRING"
numRows = 3
puts convert(s, numRows)
# P   A   H   N
# A P L S I I G
# Y   I   R
#"PAHNAPLSIIGYIR"