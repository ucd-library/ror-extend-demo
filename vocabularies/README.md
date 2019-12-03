# Vocabularies

This section describes some potential vocabularies that could be used to
describe the various research organization domains of interest.  Two examples
are shown.

## [UNESCO-6](https://en.wikipedia.org/wiki/6-digit_UNESCO_nomenclature)

This international classification is a system developed by UNESCO for
classification of research papers and doctoral dissertations.  UNESCO-6 is a
3 level hierarchy of 2-, 4- and 6-Digits.  There are about 2500 terms, 25
2-digit first level terms.  The UNESCO system is designed for higher education
only, and is limited to Science and Technology.  A three language (en,sp,fr)
[linked data version](http://skos.um.es/unesco6/unesco6.ttl) (SKOS Terminology)
has been created.

## [CIP Codes](https://nces.ed.gov/ipeds/cipcode/)

The US Dept. of Education developed the *Classification of Instructional
Programs* for educational statistics in the US and Canada. CIP Codes include
education beyond secondary level, and include non-science and technology terms.
It is also a 6-digit, 3 level hierarchy, with about 2800 terms, and 48 top level
terms.

## Comparisons

Although the format of the taxonomies are somewhat different, they can easily be
made similare enough for comparison,  The `Makefile` and other code in this directory include
a method to convert the `CIPCode2020.csv` file into a linked data format similar
to that used for UNESCO.  This is done using the [tarql]() program with the
`CIPCode2020.sparql` query.  From these two linked datasets, the Makefile
formats some common csv files for each level of the hierarchies.  It's
instructive to compare the different basic levels between the two.

In addition, you can also use sparql to query these linked data, for example the
queries below searches for agricultural terms, and then film related terms in
both taxonomies.

``` bash
p='prefix cip: <https://ror.org/vocablaries/CIPCode2020/>
   prefix skos: <http://www.w3.org/2004/02/skos/core#>';

for ttl in CIPCode2020.ttl unesco6.ttl; do
 for n in agricultur film; do
  query="$p
    select ?title
    WHERE {
     ?t skos:prefLabel ?label .
     ?t skos:notation ?notation .
     FILTER (lang(?label) = 'en') .
     FILTER regex(?label,'$n','i') .
     BIND(concat(?notation,'-',?label) as ?title)
     } order by ?notation";
	sparql --results=csv --data=$ttl --query=- <<<$query;
 done
done
```
