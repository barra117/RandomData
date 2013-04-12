require 'test/unit'
require_relative '../sampleFirstName'

class TestSampleFirstName < Test::Unit::TestCase
	def testCreate_Success
		output = SampleFirstName.create('{firstName}')
		assert_not_nil(output)
	end

	def testCreate_Failure
		output = SampleFirstName.create('{lastName}')
		assert_nil(output)
	end

	def testsample
		firstName = SampleFirstName.create('{firstName}')
		assert_not_nil(firstName)
		assert(firstName.sample.length > 0)
	end

	def testSample_new_noseed
		sampleFirstName = SampleFirstName.new()
		value = sampleFirstName.sample
		assert_not_nil(value)
		assert(value.length > 0)
	end

	def testSample_new_seed
		sampleFirstName = SampleFirstName.new(345)
		value = sampleFirstName.sample
		assert_equal('Annette', value)
	end

	def testSample_create_noseed
		sampleFirstName = SampleFirstName.create('{firstName}')
		assert_not_nil(sampleFirstName)
		value = sampleFirstName.sample
		assert_not_nil(value)
		assert(value.length > 0)
	end

	def testSample_create_seed
		sampleFirstName = SampleFirstName.create('{firstName}', 34664)
		assert_not_nil(sampleFirstName)
		value = sampleFirstName.sample
		assert_equal('Gretchen', value)
	end

end
