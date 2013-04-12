class RandomParser

	# This should return a result of objects.
	# The object would have a flag or something
	# that said whether it was a randomizer value
	# or just a constant
	def RandomParser.parse(randomString)
		parts = Array.new()
		start = false
		word = ""
		nestedCount = 0

		lastCharacter = 0.chr
		randomString.each_char { |chr| 
			if chr == '{' and start == false and lastCharacter != '\\'
				start = true
				if word.length > 0
					# parts.push(word)
					parts.push(RandomString.new(word, :Constant))
				end
				word = chr
				nestedCount = 0
			elsif chr == '{' and start == true and lastCharacter != '\\'
				word += chr
				nestedCount = nestedCount + 1
			elsif chr == '}' and start == true and nestedCount > 0 and lastCharacter != '\\'
				word += chr
				nestedCount = nestedCount - 1
			elsif chr == '}' and start == true and nestedCount == 0 and lastCharacter != '\\'
				start = false
				word += chr
				# parts.push(word)
				parts.push(RandomString.new(word, :RandomExpression))
				word = ""
				nestedCount = 0
			# elsif lastCharacter == '\\' and (chr == '{' or chr == '}') and !start
			# 	word[word.length - 1] = chr # replace the backslash character with the brace if we are not nested
			else
				word += chr
			end
			lastCharacter = chr
		}
		# if start == true
		# 	log.warn("open brace started but not closed")
		# end
		# if nestedCount > 0
		# 	log.warn("open brace nest")
		# end
		if word.length > 0 
			# parts.push(word)
			parts.push(RandomString.new(word, :Constant))
			word = ""
			nestedCount = 0
		end
		return parts
	end
end
