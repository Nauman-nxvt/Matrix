=begin
def binaryGap num   


      bit=[]
      nmbr=num
      while nmbr>0
         bit <<  nmbr%2
         nmbr=nmbr/2
      end
     bit=bit.join.reverse.split("1")   # split binary string on 1,  gives all grouped 0s  in an array ie  ['','000','000000'] 
     puts bit.max.length   #returns longest string in the bit array       
end
=end
   
   def sbrc(num)
      for i in 1..num
        bit=[]
      nmbr=i
      while nmbr>0
         bit <<  nmbr%2
         nmbr=nmbr/2
      end
        bit=bit.join.to_i(2)  
        return i if num == i*bit
      end
      return -1
   end

 puts sbrc(53434340)
