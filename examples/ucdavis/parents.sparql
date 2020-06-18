BASE <https://ror.org/05rrcem69>
PREFIX schema: <http://schema.org/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX fast: <http://id.worldcat.org/fast/>


CONSTRUCT {
  ?URI schema:parent ?PARENT;
       .
}
FROM <file:parents.csv>
WHERE {
BIND(URI(CONCAT('#',?id)) as ?URI)
BIND(URI(CONCAT('#',?parent)) as ?PARENT)
}
