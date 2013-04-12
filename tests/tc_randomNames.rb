require 'test/unit'
require_relative '../RandomNames'

# RandomNames uses the array "sample" method
# That is all it uses so no real need to test it extensively
class TestRandomNames < Test::Unit::TestCase
	def testFirstName
		assert(RandomNames.getRandomFirstName.length > 0)
	end

	def testLastName
		assert(RandomNames.getRandomLastName.length > 0)
	end

	def testFirstNames_NoBlanks
		RandomNames.firstNames.each { | firstName |
			assert(firstName.length > 0)
		}
	end

	def testLastNames_NoBlanks
		RandomNames.lastNames.each { | lastName |
			assert(lastName.length > 0)
		}
	end

end
