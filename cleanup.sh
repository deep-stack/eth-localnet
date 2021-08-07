if test -f "temp_file"; then
	rm temp_file
fi
if test -d "node00"; then
	rm -rf node00
fi
if test -f "genesis.json"; then
	rm genesis.json
fi
