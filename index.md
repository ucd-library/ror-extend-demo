# ROR Extension Best Practice

This is a draft extension describing how a research organization can extend it's
ROR identifier for describing it's local organization.  This is meant to be a
set of guidelines that help Research Organizations to use ROR as a consistent
base to define their local orangizational structure.

The following is a simple example that covers all the most important aspects of
the ROR Extension Best Practice.  Imagine that you are trying to describe the
organizational structure of your Research organization. In our case, for the
University of California, that can be found at [[https://ror.org/05rrcem69][https://ror.org/05rrcem69]].  This
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


## Format

The extension of ROR is defined as a linked data specification.  Linked data

### Ontology

A number of different organizational schemas were investigated.  These include
the [VIVO Ontology](https://wiki.lyrasis.org/display/VIVODOC111x/Ontology+Reference), the [[https://schema.org/Organization][schema.org Organization]], and the [[https://www.grid.ac/][Global Research
Identifier Database (GRID)]] ontology.  Note, that [[https://ror.org/][ROR]] has not specified a linked
data ontology for their system.  This is not a requirement, but would certainly
help integrate ROR identifiers and their extensions.  Since ROR's data format
most closely follows the GRID ontology, that would be the most normal source for
the ROR ontology.

Each ontology has their good and bad components.  In the end, we decided to
embrace the VIVO ontology.  This is because we felt is was the most likely
ontology  to be adopted by users of the ROR extension.  In addition, we freely
borrowed from VIVO class definitions, eg. Departments, Divisions, etc.

Because the VIVO ontology is currently being updated, we fully expect our ROR
ontology to be updated as well.


### JSONLD Context

In order to simplify processing, we also developed a JSON-LD context
definition.  This allows for a compact representation of the extension
organizations.  Where appropriate, we adopted notation similar to the of the ROR
community for consistancy.  These JSONLD contexts do not cover the entire range
of properties available to the organizations, as their membership to the
vivo:Organization would entail.


We also developed a context for the ROR organization JSON API as well.  This is
represented in standard VIVO ontology as well.

## Internationalization
Linked data is well organized for internationalization, with the ability to have
multiple languages annotating our structure.  While the specification fully
allows this, some our our current tooling does not support this.


## Categorizing the Organizations

It is not also clear from the

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


## Authority

It is expected that different agents may define the hierarchical arrangement of
a ROR organization,  They may, or may not actually be associated with that ROR
organization.  While this is not discouraged, applications #should# attempt to
allow users to investigate the provanance of these descriptions.  This
specification does not include an offical method of this

### Official Authority

Defining the official authoritive description of a ROR organization is beyond
the scope of this document.  However we are considering a number of potential
methods for discovery of authoritive files.

## History

Organizations change over time, and sometimes it's important to be able to track
those changes, or recreate the organizational structure at a particular moment
in time.

## Alternatives


[Open ISNI for Organizations](https://isni.ringgold.com/database/)

[ISNI Linked Data](http://www.isni.org/how-isni-works#HowItWorks_LinkedData)
[GRID Linked
Data](https://search.google.com/structured-data/testing-tool/u/0/#url=https%3A%2F%2Fwww.grid.ac%2Finstitutes%2Fgrid.27860.3b)


https://doi.org/10.6084/m9.figshare.11353022
