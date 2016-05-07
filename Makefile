all:

pelias-schema:
	mkdir pelias-schema
	curl -sL https://github.com/pelias/schema/archive/807aab4b4.tar.gz | tar -C pelias-schema --strip-components=1 -xzvf -

pelias-schema/node_modules: pelias-schema
	cd pelias-schema && npm install

install:
	find pelias-schema -type f -exec install -v -D -m0755 '{}' '$(DESTDIR)/usr/lib/nodejs/{}' \;
	install -v -D -m0755 etc/pelias-config-schema.json '$(DESTDIR)/etc/pelias-config-schema.json'
	install -v -D -m0755 bin/pelias-schema-create-index '$(DESTDIR)/usr/bin/pelias-schema-create-index'
	install -v -D -m0755 bin/pelias-schema-drop-index '$(DESTDIR)/usr/bin/pelias-schema-drop-index'
	mkdir -p -m0777 '$(DESTDIR)/var/log/pelias-schema'
