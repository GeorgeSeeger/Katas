class RomanNumerals

  def self.encode(number)
    answer = ''
    NUMERALS.each{ |k, v|
      answer += k.to_s * (number / v)
      number %= v
    }
    answer
  end

  def self.decode(numeral)
    answer = 0
    while numeral.length > 0
      NUMERALS.each do |k, v|
        if numeral.slice(0, k.to_s.length) == k.to_s then
          answer += v
          numeral.slice!(0, k.to_s.length)
        end
      end
    end
    answer
  end

  private

  NUMERALS = {M: 1000, CM: 900, D: 500, CD: 400,
              C: 100, XC: 90, L: 50, XL: 40,
              X: 10, IX: 9, V: 5, IV: 4, I: 1}

end
