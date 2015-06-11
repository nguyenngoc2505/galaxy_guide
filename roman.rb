class Roman
  attr_reader :string

  ROMAN_NUMBERS = [
    ["M" , 1000],
    ["CM" , 900],
    ["D" , 500],
    ["CD" , 400],
    ["C" , 100],
    ["XC" , 90],
    ["L" , 50],
    ["XL" , 40],
    ["X" , 10],
    ["IX" , 9],
    ["V" , 5],
    ["IV" , 4],
    ["I" , 1]
  ]

  def initialize string
    @string = string
  end

  def roman_to_arabic
    reply = 0
    ROMAN_NUMBERS.each do |key, value|
      while string.index(key) == 0
        reply += value
        string.slice! key
      end
    end
    reply
  end
end

