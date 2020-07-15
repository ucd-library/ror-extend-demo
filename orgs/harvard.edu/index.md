# Harvard Example

This example uses two CSV files to create the linked data. The data is converted
to n-triple format, then expanded jsonld with `riot` and finally compacted with
the ror-extend-demo `vivo.jsonld` context.

``` bash
c="https://ucd-library.github.io/ror-extend-demo/context/vivo.jsonld"
auth="https://ucd-library.github.io/ror-extend-demo/examples/harvard"
base="https://ror.org/03vek6s52/"
rore --authority=$auth from_csv --base=$base |\
  riot --formatted=jsonld |\
  jsonld compact --context=$c > harvard.json

```
