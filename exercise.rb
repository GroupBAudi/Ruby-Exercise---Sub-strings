dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
string = "Howdy partner, sit down! How's it going?"

def substring (string, dictionary)
  # main idea of this code is comparing with regex and then pushing the result into an array.
  # then we use said array to tally how many times said word appears (if that makes any sense)
  arr = string.downcase.split(" ") # split into ["howdy", "partner," ...]
  result = [] # to be reduced later

  dictionary.each do |dict| # kinda clumsy if I say so myself as we iterate both array to compare its values
    arr.each do |str|
      if str.match(dict) != nil 
        result.push(dict)
      end
    end
  end
  return result.reduce(Hash.new(0)) do |result, curr| 
    result[curr] += 1 # if you notice, it's the same concept as example used in https://www.theodinproject.com/lessons/ruby-basic-enumerable-methods#the-reduce-method
    result
  end
end

p substring(string, dictionary)
# => { "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2, "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 }
# werks!

# Might not be the most pretty, at least it works...