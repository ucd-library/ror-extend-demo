#! /usr/bin/env make -f
SHELL:=/usr/bin/bash

date:=2020-03-15
ror.url:=https://github.com/ror-community/ror-api/raw/master/rorapi/data/ror-${date}/ror.zip

ror.jsonld:ror.json
	jq '{"@context":"https://ucd-library.github.io/ror-extend-demo/context/vivo.jsonld","@id":"https://ror.org/","orgs":.}' $< > $@

ror.json:
	[[ -f ror.zip ]] || curl -L ${ror.url} > ror.zip
	unzip ror.zip
