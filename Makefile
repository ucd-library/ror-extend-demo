#! /usr/bin/make -f
SHELL:=/bin/bash
sparql:=/
unesco6.ttl:
	curl http://skos.um.es/unesco6/unesco6.ttl > $@

unesco2.csv: unesco6.ttl
	sparql --results=csv --data=$< --query=- <<<"prefix unesco: <http://skos.um.es/unesco6/> prefix skos: <http://www.w3.org/2004/02/skos/core#> select ?title ?notation ?label WHERE { unesco:00 skos:hasTopConcept ?t . ?t skos:notation ?notation . ?t skos:prefLabel ?label . FILTER (lang(?label) = 'en') . BIND(concat(?notation,'-',?label) as ?title) } order by ?notation" | tee $@

unesco4.csv: unesco6.ttl
	sparql --results=csv --data=$< --query=- <<<"prefix unesco: <http://skos.um.es/unesco6/> prefix skos: <http://www.w3.org/2004/02/skos/core#> select ?title ?notation ?label WHERE { unesco:00 skos:hasTopConcept ?top . ?top skos:narrower ?t. ?t skos:notation ?notation . ?t skos:prefLabel ?label . FILTER (lang(?label) = 'en') . BIND(concat(?notation,'-',?label) as ?title) } order by ?notation" | tee $@

unesco6.csv: unesco6.ttl
	sparql --results=csv --data=$< --query=- <<<"prefix unesco: <http://skos.um.es/unesco6/> prefix skos: <http://www.w3.org/2004/02/skos/core#> select ?title ?notation ?label WHERE { unesco:00 skos:hasTopConcept ?top . ?top skos:narrower ?next . ?next skos:narrower ?t . ?t skos:notation ?notation . ?t skos:prefLabel ?label . FILTER (lang(?label) = 'en') . BIND(concat(?notation,'-',?label) as ?title) } order by ?notation" | tee $@

.PHONY: clean dist-clean

clean:
	rm -f unesco2.csv unesco4.csv unesco6.csv

dist-clean: clean
	rm -f unesco6.ttl
