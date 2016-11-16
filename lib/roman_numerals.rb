class RomanNumerals


  def self.encode(number)
    number.to_s.split('').map.with_index{ |e, i|
      NUMERALS[number.to_s.length-i-1][e.to_i]
    }.join
  end

  def self.decode(numeral)
    total = numeral.split('').map{|e| SYMBOLS[e.to_sym]}.reduce(:+)
    total -= EXCEPTIONS.keys.map{ |k|
       numeral.scan(/(?=#{k.to_s})/).count * EXCEPTIONS[k]
     }.reduce(:+)
  end

  private

  NUMERALS = [['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX'],
              ['', 'X', 'XX', 'XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'],
              ['', 'C', 'CC', 'CCC', 'CD', 'D', 'DC', 'DCC', 'DCCC', 'CM'],
              ['', 'M', 'MM', 'MMM']]
  SYMBOLS = { I: 1,
              V: 5,
              X: 10,
              L: 50,
              C: 100,
              D: 500,
              M: 1000 }
  EXCEPTIONS={IV: 2,
              IX: 2,
              XL: 20,
              XC: 20,
              CD: 200,
              CM: 200 }
end
