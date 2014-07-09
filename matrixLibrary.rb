module Matrix
	

	def self.add (matrix1 ,matrix2)
		if matrix1.length!=matrix2.length or  matrix1[0].length!=matrix2[0].length
			puts "Invalid Matrix"
		else
			sum=Array.new(matrix1.length)
			for i in 0..matrix1.length-1
				sum[i]=Array.new(matrix1[0].length)
				for j in 0..matrix1[0].length-1
					 sum[i][j]=matrix1[i][j]+matrix2[i][j]
				end
			end
			sum
		end
	end 

	def self.subtract (matrix1 ,matrix2)
		if matrix1.length!=matrix2.length or  matrix1[0].length!=matrix2[0].length
			puts "Invalid Matrix"
		else
			sum=Array.new(matrix1.length)
			for i in 0..matrix1.length-1
				sum[i]=Array.new(matrix1[0].length)
				for j in 0..matrix1[0].length-1
					 sum[i][j]=matrix1[i][j]-matrix2[i][j]
				end
			end
			sum
		end
	end

	def  self.transpose (matrix)
	 	newMatrix= Array.new(matrix[0].length)
	 	for i in 0..matrix[0].length-1
	 		newMatrix[i]=Array.new(matrix.length)
	 		for j in 0..matrix.length-1
	 			newMatrix[i][j]=matrix[j][i]
	 		end
	 	end
	 	newMatrix
	end 
	def  self.scalarMul (matrix, num)
	 	for i in 0..matrix.length-1
	 		for j in 0..matrix[0].length-1
	 			matrix[i][j]=matrix[i][j] * num
	 		end
	 	end
	 	matrix
	end

	def self.display(matrix)

		for i in 0..matrix.length-1
	 		for j in 0..matrix[0].length-1
	 			print matrix[i][j]
	 			print " "
	 		end
	 		print "\n"
	 	end
	end
	def self.equal (matrix1, matrix2)

		if matrix1.length!=matrix2.length or matrix1[0].length!=matrix2[0].length
			return false
		end

		for i in 0..matrix1.length-1
	 		for j in 0..matrix1[0].length-1
	 			if matrix1[i][j]!= matrix2[i][j]
	 				return false	 				
	 			end
	 		end
	 	end
	 	return true
	end

	def  self.negative (matrix)
	 	newMatrix= Array.new(matrix.length)
	 	for i in 0..matrix.length-1
	 		newMatrix[i]=Array.new(matrix[0].length)
	 		for j in 0..matrix[0].length-1
	 			newMatrix[i][j]=-1*matrix[i][j]
	 		end
	 	end
	 	newMatrix
	end 

	def is_skew_symmetric (matrix)
		return Matrix.equal Matrix.negative(matrix),Matrix.transpose(matrix)
	end 

	def self.is_symmetric (matrix)
		return Matrix.equal matrix,Matrix.transpose(matrix)
	end 
# Multiply m1 x m2
      def self.mul (matrix1 ,matrix2)
      x=matrix1.length
      y=matrix1[0].length
      m=matrix2.length
      n=matrix2[0].length
      if y!=m 
         puts "Columns of first matrix shud be equal to rows of second matrix"
      else
          res=Array.new(x)
           p res
          for i in (0..x)
             res[0]=Array.new()
            for j in (0..n)
               p i
               p res[i][j]
               for k in (0..m)
                  res[i][j]=res[i][j]+matrix1[i][k]*matrix2[k][j]
               end
            end
          end
      end
         
         for i in 0..x-1
            res[i]=Array.new(matrix1[0].length)
            for j in 0..matrix1[0].length-1
                res[i][j]=matrix1[i][j]-matrix2[i][j]
            end
         end
         res
      end
   end

	# module end


rows=3
cols=3

#constructing first matrix
matrix1= Array.new(rows)
for i in 0..rows-1
	matrix1[i]=Array.new(cols)
end

for i in 0..rows-1
	for j in 0..cols-1
		matrix1[i][j]= i+j
	end
end

#constructing second matrix

matrix2= Array.new(rows)
for i in 0..rows-1
	matrix2[i]=Array.new(cols)
end

for i in 0..rows-1
	for j in 0..cols-1
		matrix2[i][j]= 2
   end
end

Matrix.display(matrix1)
p "-------------------"
Matrix.display(matrix2)
p "------------------"

Matrix.mul matrix1,matrix2


=begin
puts "Addition of Matrices"
sumMatrix= Matrix.add matrix1,matrix2
Matrix.display(sumMatrix)

puts "Subtraction of Matrices"
subMatrix= Matrix.subtract matrix1,matrix2
Matrix.display(subMatrix)


puts "Transpose of a Matrix"
transMatrix= Matrix.transpose matrix1
Matrix.display(transMatrix)

puts "Scalar multiplication of a Matrix"
scalar= Matrix.scalarMul matrix1,5
Matrix.display(scalar)

puts "Equality check"
if Matrix.equal matrix1,matrix2
	puts "Matrices are Equal"
else
	puts "Matrices are not Equal"
end

puts "Negative of a Matrix"
negMatrix=Matrix.negative matrix1
Matrix.display(negMatrix)

puts "Is Matrix a Symmetric Matrix"
if Matrix.is_symmetric matrix2
	puts "It is Symmetric"
else
	puts "It is not Symmetric"
=end
