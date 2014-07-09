module MyStringMethods
  def constantize
   Object.const_get(self)
  end
end

class String
  include MyStringMethods
end

 
class Calc
   
   attr_accessor :opr
   attr_accessor :num1
   attr_accessor :num2
   attr_accessor :behaviours
   
   def initialize
      @behaviours=Hash.new  
   end
     
   def regBehaviour(operator,name)   
      @behaviours[operator.to_sym]=name         
   end

    def calculate( n1 , operator , n2)
       opr = @behaviours[operator.to_sym].constantize.new
       opr.num1=n1
       opr.num2=n2
       opr.result
    end
     
end

class Add < Calc
    def result() 
        num1 + num2
    end
end
 
class Sub < Calc
    def result() 
        num1 - num2
    end
end
   
class Mul < Calc
    def result() 
        num1 * num2
    end
end   
########### Executtion block ##########

make=Calc.new
make.regBehaviour('+','Add')
make.regBehaviour('-','Sub')
make.regBehaviour('*','Mul')

puts make.calculate( 2,'+',5)
puts make.calculate( 9,'-',1)
puts make.calculate( 3,'*',3)
