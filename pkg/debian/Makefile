export

MAINTAINER_SCRIPTS = disco-master.init python3-disco-master.init \
		     disco-master.preinst disco-master.prerm \
		     python3-disco-master.preinst python3-disco-master.prerm \
		     disco-node.postinst disco-node.postrm

.PHONY: build clean

all: clean build

clean:
	(cd .. && dpkg-buildpackage -d -T clean)
	(rm -f $(MAINTAINER_SCRIPTS))
	(cd ../.. && rm -f *.changes *.dsc *.deb *.gz)

build: $(MAINTAINER_SCRIPTS) changelog compat control copyright rules
	(cd .. && dpkg-buildpackage -us -uc -d)

disco-master.init python3-disco-master.init: gen.disco-master.sh
	(./$< > $@ && chmod 755 $@)

disco-master.preinst disco-master.prerm python3-disco-master.preinst python3-disco-master.prerm: gen.stop-master.sh
	(./$< > $@ && chmod 755 $@)

disco-node.postinst: gen.create-disco-user.sh
	(./$< > $@ && chmod 755 $@)

disco-node.postrm: gen.delete-disco-user.sh
	(./$< > $@ && chmod 755 $@)
