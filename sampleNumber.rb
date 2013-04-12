class SampleNumber

	attr_reader :rangeStart, :rangeEnd, :numberFormat

	def initialize(rangeStart, rangeEnd, numberFormat = nil, seed = Random::new_seed)
		if rangeStart < rangeEnd 
			@rangeStart, @rangeEnd = rangeStart, rangeEnd
		else
			@rangeStart, @rangeEnd = rangeEnd, rangeStart
		end
		@numberFormat = numberFormat
		@random = Random.new(seed)
	end

	def SampleNumber.create(numberDefinition, seed = Random::new_seed)

		arangeStart = 0
		arangeEnd = 0

		# Maybe do something like -*\d+ so starts with 0 or 1 -, then 1 or more digits
		if (numberDefinition =~ /\{\(([-\d]+)->([-\d]+)\)(\((.*)\))*\}/) != nil
			arangeStart = $1.to_i
			arangeEnd = $2.to_i
			# $3 and $4 will be nil if it doesn't
			# match anything for the format
			# if $3 != nil then
			# 	numberFormat = $4
			# else
			# 	numberFormat = nil
			# end
			numberFormat = $4

			SampleNumber.new(arangeStart, arangeEnd, numberFormat, seed)
		else
			nil
		end
	end

	def sample
		value = (@random.rand(@rangeEnd - @rangeStart + 1) + @rangeStart)
		if @numberFormat == nil
			value.to_s
		else
			@numberFormat % value
		end
	end
end
