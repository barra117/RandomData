require 'test/unit'
require_relative '../sampleNumber'

class TestSampleNumber < Test::Unit::TestCase
	
	def test_simple_known_seed
		sampleNumber = SampleNumber.new(1, 4, nil, 9)
		assert_equal(sampleNumber.sample, '3')
	end

	def test_with_number_format
		sampleNumber = SampleNumber.new(1, 4, '%.2f', 9)
		assert_equal(sampleNumber.sample, '3.00')
	end

	def test_create
		sampleNumber = SampleNumber.create('{(1->4)(%.4f)}', 9)
		assert_equal(sampleNumber.sample, '3.0000')
	end

	def test_create_min_max_backward
		sampleNumber = SampleNumber.create('{(4->1)(%.4f)}', 9)
		assert_equal(sampleNumber.sample, '3.0000')
	end

	def test_new_noseed
		sampleNumber = SampleNumber.new(1, 2)
		value = sampleNumber.sample
		assert(value == '1' || value == '2')
	end

	def test_create_noseed
		sampleNumber = SampleNumber.create('{(1->2)}')
		value = sampleNumber.sample
		assert(value == '1' || value == '2')
	end

end
