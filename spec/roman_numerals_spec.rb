require 'roman_numerals'

describe RomanNumerals do
  subject(:roman) {RomanNumerals}
  context "ENCODING" do
    context "encoding small numbers" do
      it "should encode number 1" do
        expect(roman.encode(1)).to eq "I"
      end

      it "should encode number 2" do
        expect(roman.encode(2)).to eq 'II'
      end

      it "should encode number 3" do
        expect(roman.encode(3)).to eq 'III'
      end

      it "should encode number 4" do
        expect(roman.encode(4)).to eq 'IV'
      end

      it "should encode number 5" do
        expect(roman.encode(5)).to eq 'V'
      end

      it "should encode number 6" do
        expect(roman.encode(6)).to eq 'VI'
      end

      it "should encode number 8" do
        expect(roman.encode(8)).to eq 'VIII'
      end
    end

    context 'encoding bigger numbers' do
      it "should encode 10" do
        expect(roman.encode(10)).to eq 'X'
      end

      it 'should encode 15' do
        expect(roman.encode(15)).to eq 'XV'
      end

      it "should encode 26" do
        expect(roman.encode(26)).to eq "XXVI"
      end

      it "should encode 43" do
        expect(roman.encode(43)).to eq "XLIII"
      end

      it 'should encode 99' do
        expect(roman.encode(99)).to eq 'XCIX'
      end
    end

    context 'encoding much bigger numbers' do
      tests ={ MMCMLVI: 2956,
               MDCLXVI: 1666,
               CMXCIX: 999,
               CDXLIV: 444,
               MMXVI: 2016 }
      tests.each do |k, v|
        it "Should encode #{v}" do
          expect(roman.encode(v)).to eq k.to_s
        end
      end
    end
  end
  context "DECODING" do
    context "decoding small roman numerals" do
      decode_tests = {I: 1,
                      II: 2,
                      III: 3,
                      IV: 4,
                      V: 5,
                      VI: 6,
                      VII: 7,
                      VIII: 8,
                      IX: 9  }
      decode_tests.each do |k, v|
        it "should deconde #{k}" do
          expect(roman.decode(k.to_s)).to eq v
        end
      end

    end

    context "decoding bigger roman numerals" do
      decode_tests = {X: 10,
                      XIV: 14,
                      XXVI: 26,
                      XXXVIII: 38,
                      XLII: 42,
                      XLIV: 44,
                      LIX: 59,
                      LXVI: 66,
                      LXXIII: 73,
                      LXXXVII: 87,
                      XCIX: 99}
      decode_tests.each do |k, v|
        it "should decode #{k}" do
          expect(roman.decode(k.to_s)).to eq v
        end
      end
    end

    context "decoding very big roman numerals" do
      decode_tests = {MMMCMXCIX: 3999,
                      MDCLXVI: 1666,
                      MMXVI: 2016,
                      CCCLVI: 356,
                      MMMDCCCLXXXVIII: 3888,
                      MCDXLIV: 1444,
                      MCMLXXXIV: 1984}
      decode_tests.each do |k, v|
        it "should decode #{k}" do
          expect(roman.decode(k.to_s)).to eq v
        end
      end
    end
  end
end
