dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"

def substring (string, dictionary)
  # main idea of this code is comparing with regex and then pushing the result into an array.
  # then we use said array to tally how many times said word appears (if that makes any sense)

  # Below is older code #

  # arr = string.downcase.split # split into ["howdy", "partner," ...]
  #result = [] # to be reduced later

  # dictionary.each do |dict| # this works as well, but longer (imo, more readable too)
  # arr.each do |str|
  #   if str.match(dict) != nil 
  #     result.push(dict)
  #   end
  # end
  # return result.reduce(Hash.new(0)) do |result, curr| 
  #   result[curr] += 1 # if you notice, it's the same concept as example used in https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#the-reduce-method
  #   result
  # end

  # Above is older code #

  words = string.downcase.split # split words into array like ["howdy", "partner," ... ]

  dictionary.reduce(Hash.new(0)) do |result, dict| # creates an empty which is called result to hold all the values, dict is current iterated word in dictionary array
    words.each do |word| # loops through words array
      if word.match(dict) != nil # lots of it will result in nil, such as "howdy".match("below"), "howdy".match("down") and so on
        result[dict] += 1 
        p word.match(dict)
        # if found the same, create or modify a key and increment them by one
        # example:
        # matches "down" (dictionary) with "down!" (words array index 0), add key to 'result'
        # "down" => 1
        # and so on...
      end
    end
    result
  end
  
end

p substring(string, dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
# werks!

# Might not be the most pretty, at least it works...