 class SampleArray < Array

 	def initialize(seed = Random::new_seed)
 		@random = Random.new(seed)
 	end

 	def sample
 		self[@random.rand(length)]
 	end

	def SampleArray.create(arrayDefinition, seed = Random::new_seed)

		# Remove any whitespace on the ends
		arrayDefinition.strip!()

		# Minimum array would be {[]}
		if(arrayDefinition.length < 4)
			Log.debug("array is too small < 4. Array: '#{arrayDefinition}'")
			return nil
		end

		# Remove the leading and ending braces {}
		if(arrayDefinition[0]=='{' and arrayDefinition[arrayDefinition.length-1]=='}')
			arrayDefinition = arrayDefinition[1..arrayDefinition.length-2]
		else
			Log.debug("array does not have matching braces {}. Array: '#{arrayDefinition}'")
			return nil
		end

		arrayDefinition.strip!()

		# Remove the leading and ending square brackets
		if(arrayDefinition[0]=='[' and arrayDefinition[arrayDefinition.length-1]==']')
			arrayDefinition = arrayDefinition[1..arrayDefinition.length-2]
		else
			Log.debug("array does not have matching brackets []. Array: '#{arrayDefinition}'")
			return nil
		end

		parts = SampleArray.new(seed)
		lastCharacter = 0.chr
		entry = ''
		arrayDefinition.each_char{ |chr|


			if(chr == '|')
				if(lastCharacter == '\\')
					entry.chop!
					entry += '|'
				else
					#start new entry
					parts.push(entry)
					entry = ''
				end
			else
				entry += chr
			end
			lastCharacter = chr

			# # If the next character is a | then it is an escaped
			# # { and we need to remove the escape character
			# if(chr == '|' and lastCharacter == '\\')
			# 	entry.chop!
			# end

			# # eventually support nested arrays, but 
			# # for now just ignore that.
			# # to support that we would have to ignore anything inside braces {}
			# # and we would have to support escaped braces
			# if(chr == '|' and lastCharacter != '\\')
			# 	#start new entry
			# 	parts.push(entry)
			# 	entry = ''
			# else
			# 	entry += chr
			# end
			# lastCharacter = chr
		}
		parts.push(entry)

		return parts
	end
end
