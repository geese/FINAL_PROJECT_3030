#!/usr/bin/env ruby




# prompt the user to enter a zip code.
#
# zip - a 5 digit zip code 
#
# returns:   an array of six integers. The first five digits are the zip code,
# 			 the last digit is the checksum.
#
def printDigit(zip)
	zip_array = zip.scan /\d/
	
	chksum = 0
	zip_array.each{
		|item|
		chksum += item.to_i
	}

	if chksum % 10 != 0
		rem = chksum % 10
		zip_array.push(10 - rem)
	else
		zip_array.push(0)
	end

	zip_str = ""

	zip_array.each{
		|item|
		zip_str += item.to_s
	}
	puts "zip: #{zip_str[0..-2]}, check digit: #{zip_str[-1]}"
	return zip_array
end


# Prints decimal zipcode and check value as a barcode
# using pseudo-binary.
#
# Output Format:
# 	| xxxxx xxxxx xxxxx xxxxx xxxxx xxxxx |
# 	where x = either "|" = 1 or ":" = 0
# 
# zip_array - Decimal zipcode with check number
#
# Prints:  6 decimal digits expressed as pseudo-binary barcode
#

def printBarCode(zip_array)
	barcode_table = {1=>'00011', 2=>'00101',3=>'00110', 4=>'01001', 5=>'01010', 6=>'01100', 7=>'10001', 8=>'10010', 9=>'10100', 0=>'11000'}
	barcode = "|"
	zip_array.each{
		|digit|  # each digit is a string
		code = barcode_table[digit.to_i].scan /\d/
		code.each{
			|bit|
			bit == "0" ? barcode += ":" : barcode += "|"
		}
	}
	barcode += "|"
	puts barcode
end

if __FILE__ == $0
	puts "Please enter a zip code."
	zip = gets

	theZip = printDigit(zip)
	printBarCode(theZip)
end
