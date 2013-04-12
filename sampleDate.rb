# Code hasn't been updated; just a copy of SampleNumber still really
# Untested - needs unit tests and actually trying it.
class SampleDate

	attr_reader :rangeStart, :rangeEnd, :dateFormat

	def initialize(rangeStart, rangeEnd, dateFormat = nil, seed = Random::new_seed)
		if rangeStart < rangeEnd 
			@rangeStart, @rangeEnd = rangeStart, rangeEnd
		else
			@rangeStart, @rangeEnd = rangeEnd, rangeStart
		end
		@dateFormat = dateFormat
		@random = Random.new(seed)
	end

	def SampleDate.create(numberDefinition)

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

			#when we convert a date we will need to add 24 hours - 1 second to the end date
			#so that when we do a difference we can have a chance the last date gets picked.

			SampleNumber.new(arangeStart, arangeEnd, dateFormat)
		else
			nil
		end
	end

	def sample
		value = (rand(@rangeEnd - @rangeStart + 1) + @rangeStart)
		if @numberFormat == nil
			value.to_s
		else
			@numberFormat % value
		end
	end
end
