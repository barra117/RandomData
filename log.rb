require "logger"

class Log
	@@log = Logger.new(STDOUT)
	@@log.level = Logger::FATAL

	def Log.warn(message)
		@@log.warn(message)
	end

	def Log.error(message)
		@@log.error(message)
	end

	def Log.debug(message)
		@@log.debug(message)
	end
end