require 'test/unit'
require_relative '../log.rb'
require_relative '../sampleArray.rb'

class TestRandomArray < Test::Unit::TestCase
	
	def testRandomArray
		given = '{[34|45|\\|joe]}'
		sampleArray = SampleArray.create(given)
		assert_equal(sampleArray.length, 3)
		assert_equal('34', sampleArray[0])
		assert_equal('45', sampleArray[1])
		assert_equal('|joe', sampleArray[2])
	end

	def testRandomArray_commas
		given = '{[joe,frank,smith|other]}'
		sampleArray = SampleArray.create(given)
		assert_equal(2, sampleArray.length)
		assert_equal('joe,frank,smith', sampleArray[0])
		assert_equal('other', sampleArray[1])
	end

	def testRandomArray_spaces
		given = '{ [ joe | frank ] }'
		sampleArray = SampleArray.create(given)
		assert_equal(2, sampleArray.length)
		assert_equal(' joe ', sampleArray[0])
		assert_equal(' frank ', sampleArray[1])
	end

	def testRandomArray_sample
		given = '{[joe|frank|smith]}'
		sampleArray = SampleArray.create(given, 4)
		assert_equal('smith', sampleArray.sample)
		assert_equal('smith', sampleArray.sample)
		assert_equal('frank', sampleArray.sample)
		assert_equal('frank', sampleArray.sample)
		assert_equal('joe', sampleArray.sample)
	end

	def testRandomArray_sample_noseed
		given = '{[1|2]}'
		sampleArray = SampleArray.create(given)
		value = sampleArray.sample
		assert('1' == value || '2' == value)
	end

end
