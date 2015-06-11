require './roman'
class Sentence
  attr_reader :sentence, :words

  def initialize sentence
    @sentence = sentence
    @words = sentence.split
  end

  def type
    if words.count == 3 && words[1] == "is"
      :definition
    elsif words.last == "Credits" && words[-2] =~ /^+\d+$/
      :record
    elsif words.first == "how"
      :question
    else
      :unknown
    end
  end

  def analyze products, questions, queries
    case type
    when :definition
      puts queries
      queries[words[0]] = words[2]
    when :record
      roman = Roman.new(words[0...-4].map{|word| queries[word]}.join).roman_to_arabic
      products[words[-4]] = words[-2].to_i / roman
    when :question, :unknown
      questions << sentence
    end
    [products, questions, queries]
  end
end

