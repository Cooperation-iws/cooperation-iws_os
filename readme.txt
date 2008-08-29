Cooperation-iws - Intranet Nomad Web Server creator
	http://cooperation-iws.gensys-net.eu

REQUIREMENTS:
		Cooperation-iws uses the following:
		- python 2.4.3 (may work on other versions, but only tested on 2.4.3)
		- pygtk 2.8.6
		- squashfs-tools
		- mkisofs
		- make (for Qemu/VMware installation)
		- gcc (for Usplash generation and Qemu/VMware installation)
		- libbogl-dev (for Usplash generation)
		- rsync (for copying)

Usage: cooperation-iws.py [options]

Options:
  -h, --help            show this help message and exit
  -d, --debug           run as debug
  -v, --version         show version and exit
  -s, --skip-calcs      skip ISO size calculations



The preferred method to run Cooperation-iws is to open a console, change (cd) into the directory where cooperation-iws.py is, and type
	sudo python cooperation-iws.py


LANGUAGES:

To run Cooperation-iws in a language other than your current environment language, launch Cooperation-iws like the following:
	LANGUAGE=[code] sudo python cooperation-iws.py

For instance, to run Cooperation-iws in French:
	LANGUAGE=fr sudo python cooperation-iws.py

