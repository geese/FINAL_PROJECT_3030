#!/usr/bin/env ruby


def ctrl(values_hashes)
	v = values_hashes

	if ['P','N','D','1','2','3','R'].index(v['GS']) == nil
		return "Invalid Record: Both doors stay closed."
	end

	if v['ML'] == '1' # master unlock is activated
		if v['GS'] == 'P' # gear shift is in Park
			if v['CL'] == '0' # child lock is NOT activated
				if v['RI'] == '1' or v['RO'] == '1' or v['RD'] == '1'
					if v['LI'] == '1' or v['LO'] == '1' or v['LD'] == '1'
						return "Both doors open."
					else
						return "Right door opens."
					end
				else  # all right door switches are 0
					if v['LI'] == '1' or v['LO'] == '1' or v['LD'] == '1'
						return "Left door opens."
					else
						return "Both doors stay closed."
					end
				end
			else # child lock is activated
				if v['RO'] == '1' or v['RD'] == '1'
					if v['LO'] == '1' or v['LD'] == '1'
						return "Both doors open."
					else
						return "Right door opens."
					end
				else   # all non-inside right door switches are 0
					if v['LO'] == '1' or v['LD'] == '1'
						return "Left door opens."
					else
						return "Both doors stay closed."
					end
				end
			end
		else # gear shift is not in Park
			return "Both doors stay closed."
		end
	else # master unlock is NOT activated
		return "Both doors stay closed."
	end

end
