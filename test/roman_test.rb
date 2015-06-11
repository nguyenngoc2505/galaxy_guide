require 'minitest/autorun'
require './roman'

describe Roman do
  describe 'roman_to_arabic' do
    it 'correct roman letter' do
      @result = Roman.new("II").roman_to_arabic
      @result.must_equal 2
    end

    it 'wrong roman letter' do
      @result = Roman.new("K").roman_to_arabic
      @result.must_equal 0
    end
  end
end
