** CSV Data

For this example, there are multiple tables to represent the data. ~orgs.csv~
contains the overall

To create the ttl file from the CSV file, we need a sparql query.  This is the
orgs.sparql file.  Then we can create the file like this:

``` bash
tarql=~/.local/bin/tarql
riot=/home/quinn/apache-jena-3.9.0/bin/riot
( ${tarql} orgs.sparql;${tarql} parents.sparql )  | ${riot} --syntax=ttl --formatted=ttl --base='z:'

ucd=https://ror.org/05rrcem69
echo "BASE <$ucd>";
(${tarql} orgs.sparql;${tarql} parents.sparql ) |\
 ${riot} --syntax=ttl --formatted=ttl --base="${ucd}" |\
 sed -e 's|${ucd}||g'

```
