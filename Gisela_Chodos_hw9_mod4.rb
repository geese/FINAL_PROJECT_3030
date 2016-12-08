#!/usr/bin/env ruby

require "open-uri"
require "./Gisela_Chodos_hw9_mod3"

def getZipCodes(url)
	the_zips = []

	zips_input = open(url)
	while !zips_input.eof?
		line = zips_input.readline.delete("\n")
		the_zips.push(line)
	end
	return the_zips
end




def getZipsAndPrint
	zip_array = getZipCodes('http://icarus.cs.weber.edu/~hvalle/cs3030/data/barCodeData.txt')
	zip_array.each{
		|zip|
		theZip = printDigit(zip)
		printBarCode(theZip)
	}
end


getZipsAndPrint
