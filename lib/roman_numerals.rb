class RomanNumerals

    def self.encode(number)
      return '' if number.zero?
      NUMERALS.each do |roman, value|
        return roman.to_s + self.encode(number - value) if number >= value
      end
    end

    def self.decode(numeral)
      return 0 if numeral.nil? || numeral.empty?
      if NUMERALS.has_key?(numeral[0,2].to_sym) then
        return NUMERALS[numeral[0,2].to_sym] + self.decode(numeral[2..-1])
      elsif NUMERALS.has_key?(numeral[0].to_sym)
        return NUMERALS[numeral[0].to_sym] + self.decode(numeral[1..-1])
      end
    end

  private

  NUMERALS = {M: 1000, CM: 900, D: 500, CD: 400,
              C: 100, XC: 90, L: 50, XL: 40,
              X: 10, IX: 9, V: 5, IV: 4, I: 1}

end
