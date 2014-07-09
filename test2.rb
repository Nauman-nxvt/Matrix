class Nauman
   
   def binaryGap num   
      
       puts  num.to_s(2)
       arr= []
       arr=num.to_s(2).scan(/0+1/).map { |i|  i.length }
 
       unless arr.empty?
          return (arr.max) -1
       end
       0
   end
   
   def posInt nmbr
      int= Regexp.new(/[0-9]+/)
      int.match(nmbr) ? true : false     
   end
   def email str
      email= Regexp.new(/[A-Za-z0-9._-]+\@[A-Za-z]+\.[A-Za-z]+/)
      email.match(str) ? true : false     
   end
   
   def date str
      date= Regexp.new(/((0[1-9]{1})|([1-2]{1}[0-9]{1})|(3[0-1]{1}))\/((1[0-2]{1})|(0[1-9]{1}))\/((1[0-9]{3})|2[0-9]{3})/) # valid dates b/w years 1000 to 2999
      date.match(str) ? true : false     
   end
   
end

check=Nauman.new
p "Email: #{ check.email('nomibzu@gmail.com') }"

p "Date: #{ check.date('12/12/2009') } "

