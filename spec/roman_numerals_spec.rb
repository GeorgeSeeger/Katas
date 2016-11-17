require 'roman_numerals'

describe RomanNumerals do
  subject(:roman) {RomanNumerals}

    small_tests ={I: 1,
                  II: 2,
                  III: 3,
                  IV: 4,
                  V: 5,
                  VI: 6,
                  VII: 7,
                  VIII: 8,
                  IX: 9}
    bigger_tests ={X: 10,
                    XIV: 14,
                    XXVI: 26,
                    XXXVIII: 38,
                    XLII: 42,
                    XLIV: 44,
                    LIX: 59,
                    LXV: 65,
                    LXXIII: 73,
                    LXXXVII: 87,
                    XCIX: 99}
    very_big_tests={MMMCMXCIX: 3999,
                    MDCLXVI: 1666,
                    MMXVI: 2016,
                    MMCMLVI: 2956,
                    MDCCCLXXXVIII: 1888,
                    CCCLVI: 356,
                    MMMDCCCLXXXVIII: 3888,
                    MCDXLIV: 1444,
                    MCMLXXXIV: 1984}

  context "ENCODING" do

    context "encoding small numbers" do
      small_tests.each do |k, v|
        it "should encode #{v}" do
          expect(roman.encode(v)).to eq k.to_s
        end
      end
    end

    context 'encoding bigger numbers' do
      bigger_tests.each do |k, v|
        it "should encode #{v}" do
          expect(roman.encode(v)).to eq k.to_s
        end
      end
    end

    context 'encoding much bigger numbers' do
      very_big_tests.each do |k, v|
        it "Should encode #{v}" do
          expect(roman.encode(v)).to eq k.to_s
        end
      end
    end

  end
  context "DECODING" do

    context "decoding small roman numerals" do
      small_tests.each do |k, v|
        it "should deconde #{k}" do
          expect(roman.decode(k.to_s)).to eq v
        end
      end
    end

    context "decoding bigger roman numerals" do
      bigger_tests.each do |k, v|
        it "should decode #{k}" do
          expect(roman.decode(k.to_s)).to eq v
        end
      end
    end

    context "decoding very big roman numerals" do
      very_big_tests.each do |k, v|
        it "should decode #{k}" do
          expect(roman.decode(k.to_s)).to eq v
        end
      end
    end

  end

end
