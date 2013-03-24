
class BasicBox
	def volume
		10
	end	
end

module Decorator
  def initialize(decorated)
    @decorated = decorated
  end

  def method_missing(method, *args)
    args.empty? ? @decorated.send(method) : @decorated.send(method, args)
  end
end

class RealBox
  include Decorator

  def color
		"Blue"
	end
end

class CardboardBox
	include Decorator

	def color
		"Brown"
	end

	def volume
		@decorated.volume + 10
	end

	def material
		"Cardboard"
	end
end

class GoldenBox
	include Decorator

	def color
		"Gold"
  end

	def volume
		@decorated.volume - 10
	end

	def material
		"24K Gold"
	end
end

class BoxFactory
	def self.golden_box
		GoldenBox.new(BasicBox.new)
	end

	def self.cardboard_box
		CardboardBox.new(BasicBox.new)
	end

	def self.real_box
		RealBox.new(BasicBox.new)
	end
end

real = BoxFactory.real_box
puts real.inspect
puts real.color
puts real.volume

cardboard = BoxFactory.cardboard_box
puts cardboard.inspect
puts cardboard.color
puts cardboard.volume
puts cardboard.material

gold = BoxFactory.golden_box
puts gold.inspect
puts gold.color
puts gold.volume
puts gold.material

