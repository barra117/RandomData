require 'test/unit'
require_relative '../sampleString'

class TestSampleString < Test::Unit::TestCase
	
	def testSampleString
		testString = 'sampleString'
		sampleString = SampleString.new(testString)
		assert_equal(sampleString.sample, testString)
	end

end
