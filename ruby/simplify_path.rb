# @param {String} path
# @return {String}
def simplify_path(path)
  result = []
  i = 0
  len = path.length

  parts =  path.split("/")
  parts = parts.select { |p| p != "" && p != "." }
  parts.each do |part|
    if part == "."
      next
    end

    if part == ".."
      result.pop
      next
    end

    result << part
  end

  return "/" + result.join("/")
end


#path = "/home//foo/"
#path = "/../"
path = "/a/./b/../../c/"
puts simplify_path(path)