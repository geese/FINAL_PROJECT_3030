#!/usr/bin/env ruby


barcode_table = {1=>'00011', 2=>'00101',3=>'00110', 4=>'01001', 5=>'01010', 6=>'01100', 7=>'10001', 8=>'10010', 9=>'10100', 0=>'11000'}


def printDigit
	puts "Please enter a zip code."
	zip = gets
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

printDigit
