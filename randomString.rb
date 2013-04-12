class RandomString
	attr_reader :value, :isConstant #, :warning
	# def initialize(value, isConstant, warning)
	# 	@value, @isConstant, @warning = value, isConstant, warning
	# end
	def initialize(value, isConstant)
		@value, @isConstant = value, isConstant
	end
end
