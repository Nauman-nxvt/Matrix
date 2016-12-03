module MatrixMathNazar
   def add(m2)
      if self.cardinatily == m2.cardinatily
         m = Matrix.new
         1.upto(self.cardinatily[:rows]) do |index|
            row_m1 = self.rows(index)
            row_m2 = m2.rows(index)          
            row = []
            row_m1.each_with_index{|item, index| row << (item + row_m2[index]) }          
            m.add_row row
         end
         m
      else
         raise "Cardinality does not match"
      end
   end

   def multiply(m2)
      if self.cardinatily[:cols] == m2.cardinatily[:rows]
         m = Matrix.new
         1.upto(self.cardinatily[:rows]) do |row_index|
            resultant_row = []
            row_m1 = self.rows(row_index)       
            1.upto(m2.cardinatily[:cols]) do |col_index|
               col_m2 = m2.cols(col_index)                  
               row = []
               row_m1.each_with_index{|item, index| row << (item * col_m2[index]) }                      
               resultant_row << row.inject(&:+)
            end                                 
            m.add_row resultant_row
         end
         m
      else
         raise "Cardinality for multiplication does not match"
      end
   end
end

class Matrix
   include MatrixMathNazar
   attr_accessor :raw_data 

   def initialize(params=nil)    
      @raw_data = []
      extract_params(params) unless params.nil?
   end

   def to_s
      @result = ""
      @raw_data.each do |row|
         @result << row.map{|item| item.to_s }.join("&")
         @result << "\\\\" 
      end   
      #@result << ""
      @result
      #"\e[5m#{result}\e[0m"
   end
   
    def format res
      #result = "\xCD"
      res.each do |row|
         res << row.map{|item| item.to_s }.join(" ")
         res << "\n\r"
      end   
      res << "\n" 
      res
      #"\e[5m#{result}\e[0m"
   end
   def text_flasher(text)
    puts "\e[5m#{text}\e[0m"
   end

   def rows(index=nil)
      index.nil? ? @raw_data : @raw_data[index-1]
   end

   def cols(index=nil)
      if index.nil? 
         cols = []
         max_cols = @raw_data[0].length - 1

         0.upto(max_cols) do |col_index|           
            cols << @raw_data.map{|row| row[col_index] }
         end
         cols
      else
         @raw_data.map{|row| row[index-1] }
      end
   end

   def add_row(row)
      if @raw_data.size == 0
         @raw_data << row
      elsif row.size == @raw_data[0].size
         @raw_data << row
      else
         raise "New row size does not match"
      end
   end

   def add_column(col)
      if @raw_data.size > 0 
         @raw_data.each_with_index do |row, index|
            row << col[index]
         end
      else
         col.map{|item| @raw_data << [item] }
      end
   end

   def cardinatily
      @raw_data.size == 0 ? {rows: 0,cols: 0} : {rows: @raw_data.size,cols: @raw_data[0].size}
   end

   private
   def extract_params(params)
      # [[1,2,4],[1,4,6],[4,5,9]]
      if params.is_a? Array
         @raw_data = params
      # 1 2 3 | 4 5 6 | 7 8 9
      elsif params.is_a? String
         @raw_data = params.split("|").map{|row| row.split(" ").map!{|num| num.strip.to_i} }    
      end
   end
end


class StaticPagesController < ApplicationController
  def home
  end
  
  def mul
     
input1 = params[:m1]
input2= params[:m2]

@opr1=input1
@opr2=input1

m1 = Matrix.new(input1)
m2 = Matrix.new(input2)



m6 = m1.multiply(m2).to_s
@result= m6
     
  end

  def help
  end
  
  def about
  end
end
