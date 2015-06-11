require 'minitest/autorun'
require './sentence'

describe Sentence do
  describe 'type' do
    it 'definition' do
      @type = Sentence.new("glob is I").type
      @type.must_equal :definition
    end

    it 'record' do
      @type = Sentence.new("glob glob Silver is 34 Credits").type
      @type.must_equal :record
    end

    it 'question' do
      @type = Sentence.new("how much is pish tegj glob glob ?").type
      @type.must_equal :question
    end

    it 'unknown' do
      @type = Sentence.new("unknown").type
      @type.must_equal :unknown
    end
  end

  describe 'analyze' do
    it 'definition' do
      _, _, @queries = Sentence.new("glob is I").analyze({}, [], {})
      @queries.must_equal({"glob" => "I"})
    end

    it 'record' do
      @product, _, _ = Sentence.new("glob glob Silver is 34 Credits")
        .analyze({}, [], {"glob" => "I"})
      @product.must_equal({"Silver" => 17})
    end

    it 'question' do
      _, @questions, _ = Sentence.new("how much is pish tegj glob glob ?")
        .analyze({}, [], {})
      @questions.must_equal(["how much is pish tegj glob glob ?"])
    end
  end
end
