---
---
# ROR Extension Best Practices

This is a draft extension describing how a research organization can extend it's
ROR identifier for describing it's local organization.  This is meant to be a
set of guidelines that help Research Organizations to use ROR as a consistent
base to define their local orangizational structure.

The following is a simple example that covers all the most important aspects of
the ROR Extension Best Practice.  Imagine that you are trying to describe the
organizational structure of your Research organization. In our case, for the
University of California, that can be found at https://ror.org/05rrcem69.  This
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

## Examples 

+ [harvard](./examples/harvard) - Shows an example of some of the harvard departments.
+ [cnr_it](./examples/cnr_it) - Shows adding a tree structure to existing ROR entries
+ [ucdavis](./examples/ucdavis) - Shows most of the UC Davis acedemic structure, maintained with a Google Sheet

## Format

The extension of ROR is defined as a linked data specification.

### Ontology

A number of different organizational schemas were investigated.  These include the [VIVO Ontology (https://wiki.lyrasis.org/display/VIVODOC111x/Ontology+Reference), the [Schema.org Organization (https://schema.org/Organization), and the [Global Research Identifier Database (GRID)]([https://www.grid.ac/)
ontology.  [ROR](https://ror.org/) has not specified a linked data ontology for their system.  This is not a requirement, but would certainly help integrate ROR identifiers and their extensions.  Since ROR's data format
most closely follows the GRID ontology, that would be the most normal source for the ROR ontology.

Each ontology has their good and bad components.  In the end, we decided to embrace the VIVO ontology.  This is because we felt is was the most likely ontology  to be adopted by users of the ROR extension.  In addition, we freely
borrowed from VIVO class definitions, eg. Departments, Divisions, etc.

Because the VIVO ontology is currently being updated, we fully expect our ROR ontology to be updated as well.

### JSONLD Context

In order to simplify processing, we also developed a JSON-LD context definition.  This allows for a compact representation of the extension organizations.  Where appropriate, we adopted notation similar to the of the ROR community for consistancy.  These JSONLD contexts do not cover the entire range of properties available to the organizations, as their membership to the
vivo:Organization would entail.

The context files also work for the standard ROR organization JSON from their API as well, Although the `@context` needs to be added to the record.  The JSONLD context file is found at https://ror-extend-demo.github.api/context/vivo.jsonld.


## Internationalization
Linked data is well organized for internationalization, with the ability to have
multiple languages annotating our structure.  The specification fully
allows this for any label in the setup.  We have added some additional syntax in the JSONLD context to match how the ROR API specifies international labels for organizations.  Specifically, This example for the University of California, Davis

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


## Categorizing the Organizations

Organizations are categorized in a number of ways; including type, free text keywords, and standard links and codes.  These can all be used to organize the data.

### Types

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



### keywords

### CIPS Codes

Organizations are encouraged to add [[https://nces.ed.gov/ipeds/cipcode/default.aspx?y=55][CIPS Codes]] to their organizational records.
After a review of a number of potential classification, these codes were
determined to be the best existing solution for comparing the overlap between
organizations from different ROR entities.

CIPS codes are strictly identifiers, and not represented as linked data
formally.  To encourage the use of CIPS codes, we have created linked data
objects for the CIPS codes as well, and some of our tooling will process cips
codes specially


## History

Organizations change over time, and sometimes it's important to be able to track
those changes, or recreate the organizational structure at a particular moment
in time.

