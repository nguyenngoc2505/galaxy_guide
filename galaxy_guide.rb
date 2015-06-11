require './sentence'
require './roman'
class GalaxyGuide
  def initialize file_path
    @products = Hash.new
    @queries = Hash.new
    @questions = Array.new
    File.open(file_path, "r") do |f|
      while line = f.gets
        @products, @questions, @queries = Sentence.new(line).analyze @products,
          @questions, @queries
      end
    end
  end

  def answer_questions
    File.open("./output.txt","a+") do |f|
      @questions.each do |question|
        answer_question question, f
        f.write("\n")
      end
    end
  end

  def answer_question question, file
    words = question.split
    if question =~ /how much is/
      definition = words[3..-2]
      roman = Roman.new(definition.map{|word| queries[word]}.join).roman_to_arabic
      file.write "#{definition.join(' ')} is #{roman}"
    elsif question =~ /how many Credits is/
      definition = words[4..-3]
      product = words[-2]
      product_price = products[product]
      roman = Roman.new(definition.map{|word| queries[word]}.join).roman_to_arabic
      price = product_price * roman
      file.write "#{definition.join(' ')} #{product} is #{price} Credits"
    else
      file.write "I have no idea what you are talking about."
    end
  end

  private
  attr_reader :products, :questions, :queries
end

