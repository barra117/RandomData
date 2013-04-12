require 'test/unit'
require_relative '../sampleLine'

class TestSampleLine < Test::Unit::TestCase
	
	def testSampleLine_arraytest
		hereCount = 0
		thereCount = 0
		for count in 1..100
			sampleLine = SampleLine.new('abc{[here|there]}def')
			case sampleLine.sample
				when 'abcheredef'
					hereCount += 1
				when 'abctheredef' 
					thereCount += 1
				else 
					assert(false, "Unknown result: #{sampleLine}")
			end
		end
		assert(hereCount > 0 && thereCount > 0, "There is a chance this might fail, but unlikely.")
	end

	def testNames
		sampleLine = SampleLine.new("{firstName},{lastName},{[frank was here|joe]}{(-2->4)}")
		#puts(sampleLine.sample)
		assert_nothing_thrown() { sampleLine.sample }
	end
end
