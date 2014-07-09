class GeneralBehavior
	attr_accessor :num1
	attr_accessor :num2

	def initialize(n1, n2)
		@num1=n1
		@num2=n2
	end
end

class Add < GeneralBehavior
	def calculate()
		puts num1 + num2
	end
end

class Sub < GeneralBehavior
	def calculate()
		puts num1 - num2
	end
end

module MyStringMethods
	def constantize
	 Object.const_get(self)
	end
end

class String
	include MyStringMethods
end

class Calculator
	attr_accessor :operand1, :operand2, :operator
	attr_accessor :behaviors

	def initialize()
		@behaviors = Hash.new
	end

	def register_behavior(operator, behavior)
		@behaviors[operator.to_sym] = behavior
	end

	def process
		behavior = @behaviors[@operator.to_sym]
		puts behavior.constantize
		behavior = behavior.constantize.new(@operand1, @operand2)
		behavior.calculate
	end

end


puts "///Welcome To The Loosely Coupled Calculator"

obj=Calculator.new()
obj.register_behavior('+', 'Add')
obj.register_behavior( '-', 'Sub')

obj.operand1 = 5
obj.operand2 = 6
obj.operator = '+'

puts obj.process


