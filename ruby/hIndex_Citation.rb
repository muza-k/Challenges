# @param {Integer[]} citations
# @return {Integer}
def h_index(citations)
  citation = 0
  filtered_citations = citations
  (1..citations.length).each do |c|
    filtered_citations.keep_if { |x| x >= c }
    if filtered_citations.length >= c
      citation = c
      puts "Setting new citation to #{c}"
    end
  end
  citation
end