# Departmental Extension for the Research Organization Registry (ROR)

ROR, the Research Organization Registry (available from [ror.org](https://ror.org/)) is a community-led project developing an open registry of unique identifiers for research organizations around the world. The initial version of the repository has been available since January 2019, and close to 100,000 research organizations have now been assigned unique identifiers.

These organizations form a diverse collection including unversities, research institutes, government agencies, medical facilities, nonprofit organizations, and corporations that engage in scholarly research. To limit the complexity of the dataset ROR generally assigns identifiers only to "top-level" organizations, so the details of organizational structure are not generally captured within ROR itself.

## Why extend ROR?


Further technical details can be found [on the technical details page](details.md).

## How to use the data

### Departments of a single organization

When a researcher has identified their institution at the ROR id level, a more detailed affiliation identifier may be associated with them by allowing the researcher to select (via browse, search, auto-complete, etc.) from the departmental file for that ROR id. For example for ROR id https://ror.org/03vek6s52 (Harvard University), the file 03vek6s52.jsonld would be loaded from this repository, with the list of "orgs" and their associated names and id's, and displayed or handled with a suitable user interface and/or API. If the researcher selects "Applied Physics", then they would be associated with the extended identifier https://ror.org/03vek6s52/applied_physics.

Note that the extension data includes a hierarchy, with relations provided by the "parent" predicate. For "Applied Physics" at Harvard, the parent is "School of Engineering and Applied Sciences", which has its own extended identifier, https://ror.org/03vek6s52/school_of_engineering_and_applied_sciences. A user interface may choose to use or ignore this hierarchy as appropriate. The "types" predicate may provide some filtering in cases where some levels of organizational hierarchy are not useful as identifiers in a particular context.

### Cross-organizational data

Rather than looking at one extension file alone, some applications will require loading all the available files. The data could be put into a triple store or other graph database for querying. To provide a filtered list of departments, institutes, or other types of sub-organizations that cover a particular subject, say "Economics", would be a matter of finding triples with a "vivo:hasSubjectArea" value starting with "vocabularies:cip#45.06".

More sophisticated querying, for example by country or top-level organization type, might require combining the ROR linked-data with this extended ROR linked-data in the same graph database, or doing some form of federated query. Statistical analysis, for example getting counts of departments in different subject areas by country, could also be handled with a combined graph database, assuming the extension data is sufficiently complete.

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


## Alternatives

[Open ISNI for Organizations](https://isni.ringgold.com/database/)

[ISNI Linked Data](http://www.isni.org/how-isni-works#HowItWorks_LinkedData)

[GRID Linked
Data](https://search.google.com/structured-data/testing-tool/u/0/#url=https%3A%2F%2Fwww.grid.ac%2Finstitutes%2Fgrid.27860.3b)

## More
See also our [technical details page](details.md).
