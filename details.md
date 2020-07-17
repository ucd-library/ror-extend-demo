---
---
# ROR Extension Technical Details

## Standards and formats used

### JSONLD Context

The extension of ROR is defined as a linked data specification, with files provided in the [JSON-LD](https://json-ld.org) (JSON linked data) format. JSON is a versatile, open file format. We want the data to be re-usable in multiple solutions. On one end, the plain text format allows manual lookup for users who are interested in a handful of datapoints. On the other end, setting up a linked data database will allow complex queries leveraging relationships between units. Finally, the selected format allows for an intermediate-complexity solution, with the data imported into a relational database. 
In order to simplify processing, we developed a JSON-LD context definition. It allows the addition of elements outside of the core schema, for example, names of the institution in different languages.


### ROR extension schema decisions

A number of different organizational schemas were investigated.  These include the [VIVO Ontology](https://wiki.lyrasis.org/display/VIVODOC111x/Ontology+Reference), the [Schema.org Organization](https://schema.org/Organization), and the [Global Research Identifier Database (GRID)]([https://www.grid.ac/)
ontology.  [ROR](https://ror.org/) has not specified a linked data ontology for their system.  After weighing pros and cons, we decided to embrace the VIVO ontology.  This is because we felt is was the most likely ontology to be adopted by users of the ROR extension.  In addition, we freely borrowed from VIVO class definitions, eg. Departments, Divisions, etc.

Because the VIVO ontology is currently being updated, we fully expect our ROR ontology to be updated as well.

### Controlled vocabularies

#### Organizations

For assigning classed to the organizations, we encourage the use of the VIVO Organization Types. These are:

| | | |
| --- | --- | --- |
| Academic Department | Divison | Museum
| Association | Extension Unit | Private Company
| Center | Foundation | Program
| Clinical Organization | Funding Organization | Publisher
| College | Government Agency | Research Organization
| Company | Hospital | School
| Consortium | Institute | Service Providing Laboratory
| Core Laboratory | Laboratory | University
| Department | Library



#### Keywords

We identified the subject area researched or taught within a unit to be of interest to stakeholders. Therefore, we needed to identify a controlled vocabulary that would allow describing all fields of scholarship within a department. Using a controlled vocabulary would also allow discovery of similar scholarship across multiple institutions. Selecting a comprehensive vocabulary proved challenging, after we discovered that several widely used options were science and technology heavy (eg., UNESCO codes, the Australian and New Zealand Standard Research Classification ([ANZSRC](http://registry.it.csiro.au/def/keyword/anzsrc))), and we needed a comparable comprehensiveness in the arts and humanities. 

We selected [CIP Codes](https://nces.ed.gov/ipeds/cipcode/default.aspx?y=55) as a comprehensive controlled vocabulary to describe the scholarship of a unit with an institutional. CIP codes are strictly identifiers, and not represented as linked data formally.  To encourage the use of CIP codes, we have created linked data
objects for the CIP codes as well, and some of our tooling will process CIP codes specially.


## Details of the ROR Extension Schema

The following is a simple example that covers all the most important aspects of
the ROR Extension Best Practice.  Imagine that you are trying to describe the
organizational structure of your research organization. In our case, for the
University of California, Davis that can be found at https://ror.org/05rrcem69.  This
is a persistent identifier for this Unversity.  Now imagine we'd like to
identify a particular department in our University.  In JSON, that might look
like this:


``` json
{
   "id":"lawr",
   "name":"Department of Land, Air, and Water Resources",
   "alias": "LAWR",
}
```

Where we've given it an identifier, and name.  That's great, but then we want to
use this file to show all the departments in our Division.

``` json
{
  "id": "http://ror.org/05rrcem69",
  "type": "University",
  "orgs": [
    {
      "id": "lawr",
      "name": "Department of Land, Air, and Water Resources",
      "alias": "LAWR",
      "type": "Department",
      "keywords": [
        "40.0401 - Atmospheric Sciences and Meteorology, General.",
        "40.0605 - Hydrology and Water Resources Science.",
        "01.1299 - Soil Sciences, Other.",
        "01.1201 - Soil Science and Agronomy, General."
      ],
      "parent": "env_sci"
    },
    {
      "id": "toxicology",
      "name": "Environmental Toxicology",
      "type": "Department",
      "parent": "env_sci"
    },
    {
      "id": "esp",
      "name": "Environmental Science and Policy",
      "type": "Department",
      "parent": "env_sci"
    },
    {
      "id": "env_sci",
      "name": "Environmental Sciences",
      "type": "Division",
      "parent": "aes"
    },
    {
      "id": "aes",
      "name": "College of Agricultural and Environmental Sciences",
      "alias": "AES",
      "type": "College"
    }
  ]
}
```

### Examples 

+ [harvard](https://github.com/ucd-library/ror-extend-demo/tree/master/orgs/harvard.edu) - Shows an example of some of the harvard departments.
+ [cnr_it](https://github.com/ucd-library/ror-extend-demo/tree/master/orgs/cfa.harvard.edu/cnr_it) - Shows adding a tree structure to existing ROR entries
+ [ucdavis](https://github.com/ucd-library/ror-extend-demo/tree/master/orgs/ucdavis.edu) - Shows most of the UC Davis acedemic structure, maintained with a Google Sheet

## Template to generate extensions

Copy this ["example department speadsheet"](https://docs.google.com/spreadsheets/d/13MD8wKxe235DWsKQJ9eBAlvEenkFzKQlFDFGhNNIt1w/edit#gid=770416888) to jump-start the process for generation ROR extensions. The instructions on how to fill out the spreadsheet for your institution, as well as the documentation for the spreadsheet are available [here](https://docs.google.com/document/d/1DwLOxIC92NCq_JSzCF1FAP_JBCV8N99bUOQS9atHp-4/edit).

## Multiple languages

Linked data is well organized for internationalization, allowing labels in
multiple languages.
We have added some additional syntax in the JSONLD context to match how the ROR API specifies language labels for organizations.  Specifically, This example for the University of California, Davis

```json
{
  "@context":"https://ucd-library.github.io/ror-extend-demo/context/vivo.jsonld",
  "id": "https://ror.org/05rrcem69",
  "name": "University of California, Davis",
  "labels": [
    {
      "label": "Université de Californie à Davis",
      "iso639": "fr"
    },
    {
      "label": "Universidad de California en Davis",
      "iso639": "es"
    }
  ],
```

Expands to this linked data.

```json
{
    "@id": "https://ror.org/05rrcem69",
    "http://www.w3.org/2000/01/rdf-schema#label": [
      {
        "@language": "fr",
        "@value": "Université de Californie à Davis"
      },
      {
        "@language": "es",
        "@value": "Universidad de California en Davis"
      },
      {
        "@language": "en",
        "@value": "University of California, Davis"
      }
    ],
}
```


## Future directions

### More testing

Ultimately, we need more stakeholders to create ROR extensions and provide feedback on the process.

### Connecting datasets

Ideally, the central ROR dataset will be seamlessly integrated with the extensions generated by research institutions. In the present, this is possible through searching on the top ROR identifier. We envision additional metadata field in the ROR schema that would accommodate a DOI. Each institutional dataset of extended identifiers will be issued a DOI that would then be recorded in the ROR identifier for that organization. This will allow for automated download and merge of the datasets.

### History

Organizations change over time. Stakeholders are interested in tracking those changes or recreating the organizational structure at a particular moment in time. Future development of the schema will include additing fields to refer to preceding units.



