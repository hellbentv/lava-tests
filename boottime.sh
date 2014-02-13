echo "Return the time stamp the first init call was logged in dmesg"
firstinit=$(dmesg | grep init\: | sed 's/^\[[ ]*\?\([0-9.]*\)\] \(.*\)/\\1 \\2/' | cut -d ' ' -f 1 | head -n 1)
lava-test-case firstinittime --result pass --measurement $firstinit --units seconds
