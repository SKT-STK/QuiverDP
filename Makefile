run:
	beet build
	xcopy schedule.py build /Y /I
	cd build && python schedule.py
