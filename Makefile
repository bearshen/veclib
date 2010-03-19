PREFIX=/usr/local
CROSS=

CXX=$(CROSS)g++ -std=gnu++0x -Wall
FLAGS=-O3

all: vecliball_pp31.h vecliball_pp30.h vecliball_pp20.h vecliball_pp10.h vecliball_pp00.h

vecliball_pp31.h: Makefile *.h
	$(CXX) $(FLAGS) -mssse3 -include veclib_conf.h vecliball.h -o vecliball_pp.tmp11 -E
	grep vecliball_pp.tmp11 -e ^[^#] > vecliball_pp.tmp12
	uncrustify -f vecliball_pp.tmp12 -l CPP -o vecliball_pp31.h -c uncrustify.cfg
	rm vecliball_pp.tmp11 vecliball_pp.tmp12

vecliball_pp30.h: Makefile *.h
	$(CXX) $(FLAGS) -msse3 -include veclib_conf.h vecliball.h -o vecliball_pp.tmp21 -E
	grep vecliball_pp.tmp21 -e ^[^#] > vecliball_pp.tmp22
	uncrustify -f vecliball_pp.tmp22 -l CPP -o vecliball_pp30.h -c uncrustify.cfg
	rm vecliball_pp.tmp21 vecliball_pp.tmp22

vecliball_pp20.h: Makefile *.h
	$(CXX) $(FLAGS) -msse2 -include veclib_conf.h vecliball.h -o vecliball_pp.tmp31 -E
	grep vecliball_pp.tmp31 -e ^[^#] > vecliball_pp.tmp32
	uncrustify -f vecliball_pp.tmp32 -l CPP -o vecliball_pp20.h -c uncrustify.cfg
	rm vecliball_pp.tmp31 vecliball_pp.tmp32

vecliball_pp10.h: Makefile *.h
	$(CXX) -m32 $(FLAGS) -msse -include veclib_conf.h vecliball.h -o vecliball_pp.tmp41 -E
	grep vecliball_pp.tmp41 -e ^[^#] > vecliball_pp.tmp42
	uncrustify -f vecliball_pp.tmp42 -l CPP -o vecliball_pp10.h -c uncrustify.cfg
	rm vecliball_pp.tmp41 vecliball_pp.tmp42

vecliball_pp00.h: Makefile *.h
	$(CXX) -m32 $(FLAGS) -include veclib_conf.h vecliball.h -o vecliball_pp.tmp51 -E
	grep vecliball_pp.tmp51 -e ^[^#] > vecliball_pp.tmp52
	uncrustify -f vecliball_pp.tmp52 -l CPP -o vecliball_pp00.h -c uncrustify.cfg
	rm vecliball_pp.tmp51 vecliball_pp.tmp52

clean:
	-rm vecliball_pp*.h

install:
	install -m 644 vecliball_pp*.h $(PREFIX)/include/
	install -m 644 veclib.h $(PREFIX)/include/
	install -m 644 veclib_conf.h $(PREFIX)/include/

uninstall:
	rm $(PREFIX)/include/vecliball_pp*.h
	rm $(PREFIX)/include/veclib.h
	rm $(PREFIX)/include/veclib_conf.h

.PHONY: clean install uninstall

