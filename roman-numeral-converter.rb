class RomanArabicConverter
  CONVERSION_CHART = {
    1000  => 'M',
    900   => 'CM',
    500   => 'D',
    400   => 'CD',
    100   => 'C',
    90    => 'LC',
    50    => 'C',
    40    => 'XC',
    10    => 'X',
    9     => 'IX',
    5     => 'V',
    4     => 'IV',
    1     => 'I'
  }

  def self.to_roman(arabic_numeral)
    roman_numeral = ''
    CONVERSION_CHART.each do |arabic, roman|
      while arabic_numeral >= arabic do
        roman_numeral << CONVERSION_CHART[arabic]
        arabic_numeral -= arabic
      end
    end
    roman_numeral
  end

  def self.to_arabic(roman_numeral)

  end
end

p RomanArabicConverter.to_roman(2589) == 'MMDCXXXIX'
p RomanArabicConverter.to_roman(3244) == 'MMMCCXCIV'