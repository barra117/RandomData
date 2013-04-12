require_relative 'randomParser'
require_relative 'randomString'
require_relative 'sampleArray'
require_relative 'log'
require_relative 'sampleFirstName'
require_relative 'sampleLastName'
require_relative 'sampleString'
require_relative 'sampleNumber'
require_relative 'randomNames'

class SampleLine
	attr_reader :sampleObjects

	def initialize(line, seed = Random::new_seed)
		@sampleObjects = Array.new()
		@seed = seed
		init(line)
	end

	def init(line)
		sampleStrings = RandomParser.parse(line)
		sampleStrings.each{ |entry|

			if(entry.isConstant == :RandomExpression)
				sampleObj = SampleArray.create(entry.value, @seed)
				if(sampleObj == nil)
					sampleObj = SampleFirstName.create(entry.value)
					if(sampleObj == nil)
						sampleObj = SampleLastName.create(entry.value)
						if(sampleObj == nil)
							sampleObj = SampleNumber.create(entry.value, @seed)
							if(sampleObj == nil)
								Log.error("Unknown random expression.")
							end
						end
					end
				end
				if(sampleObj != nil)
					@sampleObjects.push(sampleObj)
				end
			else
				@sampleObjects.push(SampleString.new(entry.value))
			end
		}
	end

	def sample
		output = String.new('')
		@sampleObjects.each{ |obj|
			output += obj.sample
		}
		return output
	end
end
