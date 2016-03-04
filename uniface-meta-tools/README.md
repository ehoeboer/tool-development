# Meta Tools #

Meta Tools is a collection of services for working with the Uniface repository.

* VREPO_COMMON - Operations for querying for statistics in the repository. For example, does this signature have any non-Uniface implementations?
* VREPO_DELETE - Deletes objects from the repository
* VREPO_EXPORT - A wrapper service for $ude("export")
* VREPO_EXPPARSER - Reports on the contents of a Uniface export file
* VREPO_IMPORT - A wrapper service for $ude("import")

Supporting services:

* VCOM_VALIDATORS - Contains operations to validate if an export file contains newer versions of Uniface development objects.
 * VCOM_BUILD_S - Service responsible for building this project

### Contributors ###

* David Akerman
* James Rodger