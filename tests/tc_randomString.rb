require 'test/unit'
require_relative '../randomString'

class TestRandomString < Test::Unit::TestCase
	
	def testRandomString_init_value_isConstant
		value = 'blue'
		isConstant = :RandomExpression
		randomString = RandomString.new(value, isConstant)
		assert_equal(randomString.value, value)
		assert_equal(randomString.isConstant, isConstant)
	end

end
