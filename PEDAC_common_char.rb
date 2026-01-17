=begin
Given an array of strings made only from lowercase letters,
return an array of all characters that
show up in all strings within the given array (including duplicates).
if a character occurs 3 times in all strings but not 4 times.
you need to include that character three times in the final array.

P= return an array of characters
  extract common characters from all strings in the input array even duplicates
  Condition: for a chracter to be included in the result array, it must appear in all strings
=end

def common_char(arr)

end

p common_char(["bella", "label", "roller"]) #== ["e", "l", "l"]
