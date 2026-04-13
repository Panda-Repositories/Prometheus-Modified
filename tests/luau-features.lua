local total = 0
for i = 1, 10 do
	if i % 2 == 0 then
		total += i
		continue
	end
	total += 1
end

assert(total == 35)
print(total)
