ROR, the Research Organization Registry (available from [ror.org](https://ror.org/)) is a community-led project developing an open registry of unique identifiers for research organizations around the world. The initial version of the repository has been available since January 2019, and close to 100,000 research organizations have now been assigned unique identifiers.

These organizations form a diverse collection including unversities, research institutes, government agencies, medical facilities, nonprofit organizations, and corporations that engage in scholarly research. To limit the complexity of the dataset ROR generally assigns identifiers only to "top-level" organizations, so the details of organizational structure are not generally captured within ROR itself.

## Why extend ROR?

The key impetus behind extending ROR to units within an institution is to be able to refer to the affiliations of a researcher at a university (eg. department, institute) in a consistent manner. When a college, faculty, department, institute or center name is used as a free text, the practice opens the door to inconsistencies. Having sub-institution-level identifier will benefit the following use-cases:

* Referring to a unit after a name change
* Consistently referring to faculty and staff within a unit for staff websites and expertise discovery sites
* Identifying work produced by the unit in support of accreditations or progress and final reports
* Identifying work from units with specific subject area across institutions for collection purposes
* Matching internal identifiers used by an agency to a global reference

The initial proposal to extend ROR ids presented by Carolyn Grant at PIDapalooza 2020 can be found in ["The Path to Department Level PIDs", 10.5281/zenodo.3635003](https://doi.org/10.5281/zenodo.3635004).

## How to use the data

### Departments of a single organization

When a researcher has identified their institution at the ROR id level, a more detailed affiliation identifier may be associated with them by allowing the researcher to select (via browse, search, auto-complete, etc.) from the departmental file for that ROR id. For example for ROR id https://ror.org/03vek6s52 (Harvard University), the file 03vek6s52.jsonld would be loaded from this repository, with the list of "orgs" and their associated names and id's, and displayed or handled with a suitable user interface and/or API. If the researcher selects "Applied Physics", then they would be associated with the extended identifier https://ror.org/03vek6s52/applied_physics.

Note that the extension data includes a hierarchy, with relations provided by the "parent" predicate. For "Applied Physics" at Harvard, the parent is "School of Engineering and Applied Sciences", which has its own extended identifier, https://ror.org/03vek6s52/school_of_engineering_and_applied_sciences. A user interface may choose to use or ignore this hierarchy as appropriate. The "types" predicate may provide some filtering in cases where some levels of organizational hierarchy are not useful as identifiers in a particular context.

### Cross-organizational data

Rather than looking at one extension file alone, some applications will require loading all the available files. The data could be put into a triple store or other graph database for querying. To provide a filtered list of departments, institutes, or other types of sub-organizations that cover a particular subject, say "Economics", would be a matter of finding triples with a "vivo:hasSubjectArea" value starting with "vocabularies:cip#45.06".

More sophisticated querying, for example by country or top-level organization type, might require combining the ROR linked-data with this extended ROR linked-data in the same graph database, or doing some form of federated query. Statistical analysis, for example getting counts of departments in different subject areas by country, could also be handled with a combined graph database, assuming the extension data is sufficiently complete.

## Authority

It is expected that different stakeholders, eg. funders and publishers may define the hierarchical arrangement of a ROR organization.  They may, or may not actually be associated with that ROR organization at the present time. In our best practices, we outline that a separate file needs to be created for each institution before further aggregation files are created. Consequtive users will re-use the same file. 

### Official Authority

Defining the official authoritive description of a ROR organization is beyond the scope of this document. However we are considering a number of potential
methods for discovery of authoritive files. As the project develops further, we hope that a representative of each institution will update and complete the file for their institution. We propose including a "same as" field in the metadata for previously assigned extensions taht the institution wants replaced. That way the current schema will reflect the institutional preference, but previous ids that may already be in use will still resolve. In the ideal future, a curation board would undertake determining the authorization an individual has for changing a ROR extension.

## Alternatives

The International Standard Name Identifier (ISNI - [isni.org](https://isni.org) ) includes records for many organizations and their subsidiary components.  However, it does not directly provide hierarchical relationships.

[Ringgold](https://www.ringgold.com) provides a proprietary database that has extensive details on organizations and their subsidiaries. Ringgold also provides an open dataset based on their data but using the ISNI identifiers - see [Open ISNI for Organizations](https://isni.ringgold.com/database/).

The [VIVO software tool](https://duraspace.org/vivo/about/) provides a way for organizations to post open linked data about their own research activities, which may include departmental hierarchies. Some installations have considerable detail, but with each site maintained separately there is also a lot of inconsistency, and some VIVO installations listed in the directory seem to be no longer running. 

[Wikidata](https://www.wikidata.org/) has a few research institutions with relatively complete subsidiary organization information, but this is at least for now relatively sparse and idiosyncratic. Where an entry exists Wikidata potentially provides other identifiers that may be available for that entity, so it can be useful as a linking hub.

There are a number of identifiers focused on corporations - [D-U-N-S numbers](https://www.dnb.com/duns-number.html), [Legal Entity Identifiers](https://www.gleif.org/en/about-lei/introducing-the-legal-entity-identifier-lei), [OpenCorporates](https://opencorporates.com/), and others - these often include hierarchical relationship information, but generally do not include much data for the educational or government entities that are important for research.

## More
See also our [technical details page](details.md).
