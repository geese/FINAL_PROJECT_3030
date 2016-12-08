#!/usr/bin/env ruby

require "open-uri"
require "./Gisela_Chodos_hw9_mod1"




# Open a url, read a file, and return a list of each line in the file.
# 
# url - the url to open
#
# Returns an array.  Each array element is a line from the file.
#
def getMinivanTestFile(url)
	array_of_records = []
	input_csv = open(url)
	while !input_csv.eof?
		line = input_csv.readline.delete("\n")
		array_of_records.push(line.split(',')[1..-1])
	end
	return array_of_records
end



# Make an array of hashes which each map a Header Record value to a Record value
# 
# record_array - an array of records, the first one is the Header Record
#
# Returns an array of hashes mapping each Header Record to its value
#
def makeInputValuesDicts(record_array)
	header_record = record_array.shift
	values_hashes = []

	record_array.each_with_index{
		|item, index|
		theHash = Hash.new
		header_record.each_with_index{
			|jitem, jindex|
			theHash[header_record[jindex].delete(" ")] = record_array[index][jindex].delete(" ")
		}
		values_hashes.push(theHash)
		#puts "#{index} = #{item}"
	}
	return values_hashes
end

# Read and print the records in an array of hashes
#
# values_hashes - the array of hashes mapping Header Record values
# 				  to Record values
#
def printRecords(values_hashes)
	values_hashes.each_with_index{
		|item, i|
		puts "Reading Record #{i+1}"
		puts "Left dashboard switch (0 or 1): #{item['LD']}"
		puts "Right dashboard switch (0 or 1): #{item['RD']}"

		puts "Child lock switch (0 or 1): #{item['CL']}"
		puts "Master unlock switch (0 or 1): #{item['ML']}"
		puts "Left inside handle (0 or 1): #{item['LI']}"
		puts "Left outside handle (0 or 1): #{item['LO']}"
		puts "Right inside handle (0 or 1): #{item['RI']}"
		puts "Right outside handle (0 or 1): #{item['RO']}"
		puts "Gear shift position (P, N, D, 1, 2, 3 or R): #{item['GS']}"
		puts ctrl(item)
		puts "\n"
	}
	
end

records_list = getMinivanTestFile("http://icarus.cs.weber.edu/~hvalle/cs3030/data/minivanTest.csv")

values_hashes =  makeInputValuesDicts(records_list)


printRecords(values_hashes)
