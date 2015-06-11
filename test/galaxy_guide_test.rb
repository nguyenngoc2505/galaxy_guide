require 'minitest/autorun'
require 'pathname'
require './galaxy_guide'

describe GalaxyGuide do
  after do
    File.delete('./output.txt')
  end

  describe 'answer_questions' do
    let(:input_path) { "./input.txt" }

    before do
      GalaxyGuide.new(input_path).answer_questions
    end

    describe './output.txt' do
      it 'generates it' do
        content = Pathname.new('./output.txt').read
        content.must_match %(pish tegj glob glob is 42)
        content.must_match %(glob prok Silver is 68 Credits)
        content.must_match %(glob prok Gold is 57800 Credits)
        content.must_match %(glob prok Iron is 780 Credits)
        content.must_match %(I have no idea what you are talking about.)
      end
    end
  end
end
