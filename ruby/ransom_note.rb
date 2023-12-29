# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)

  ransom_note.each_char do |c|
    index = magazine.index(c)
    if index
      magazine.slice!(index)
    else
      return false
    end
  end
  true
end


ransomNote = "aac"
magazine = "aab"
puts can_construct(ransomNote, magazine)