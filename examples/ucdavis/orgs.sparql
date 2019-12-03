BASE <https://ror.org/05rrcem69>
PREFIX schema: <http://schema.org/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX fast: <http://id.worldcat.org/fast/>

 CONSTRUCT {
   ?URI schema:keywords ?k;
   .
 }
 FROM <file:orgs.csv>
 WHERE {
   BIND(URI(CONCAT('#',?id)) as ?URI)
   VALUES ?num { 0 1 2 3 4 5 }
   BIND (concat("^([^;]*(;|$)){0,",str(?num),"}([^;]*)?(;.*)?") AS ?skipN)
   BIND (replace(?keywords, ?skipN, "$3") AS ?k)
   FILTER (strlen(?k)>0)
   }

CONSTRUCT {
 ?URI a schema:Organization;
      schema:name ?n ;
  schema:keywords ?k ;
 #schema:location ?Location;
 #schema:date ?y;
 #schema:date ?ymd;
 #schema:about fast:893952, fast:1424061;
 #schema:license <http://rightsstatements.org/vocab/CNE/1.0/>;
 #schema:isPartOf <https://oac.cdlib.org/findaid/ark:/13030/c8xd13fg/>;
 #schema:description ?Notes .
   .
 }
 FROM <file:orgs.csv>
 WHERE {
   BIND(URI(CONCAT('#',?id)) as ?URI)
   BIND (STRLANG(?name, "en") AS ?n)
   OPTIONAL { ?URI schema:keywords ?k . }
 }
