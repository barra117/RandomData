require 'test/unit'
require_relative '../sampleLastName'

class TestSampleLastName < Test::Unit::TestCase
	def testCreate_Success
		output = SampleLastName.create('{lastName}')
		assert_not_nil(output)
	end

	def testCreate_Failure
		output = SampleLastName.create('{firstName}')
		assert_nil(output)
	end

	def testsample
		lastName = SampleLastName.create('{lastName}')
		assert_not_nil(lastName)
		assert(lastName.sample.length > 0)
	end

	def testSample_new_noseed
		sampleLastName = SampleLastName.new()
		value = sampleLastName.sample
		assert_not_nil(value)
		assert(value.length > 0)
	end

	def testSample_new_seed
		sampleLastName = SampleLastName.new(345)
		value = sampleLastName.sample
		assert_equal('Lambert', value)
	end

	def testSample_create_noseed
		sampleLastName = SampleLastName.create('{lastName}')
		assert_not_nil(sampleLastName)
		value = sampleLastName.sample
		assert_not_nil(value)
		assert(value.length > 0)
	end

	def testSample_create_seed
		sampleLastName = SampleLastName.create('{lastName}', 34664)
		assert_not_nil(sampleLastName)
		value = sampleLastName.sample
		assert_equal('Olson', value)
	end	
end
