This is a set of instructions telling you how to create a new version of VPE
for official release to the public.

* 2nd line Version update using a KIDS utility
* Test ..VER
* Run XINDEX and fix any problems that are not OS related
* Run Unit Tests for last time on dev system
* Copy all updated 2nd line routines to repo
* Double check that the routines in the repo are the same as in the system.
* Create .RSA file (usually using the Scripts/PackRO.py Utility in OSEHRA/VistA repo.
* Run Unit Tests on GT.M or YDB on FOIA VistA
* Run Unit Tests on Cache on FOIA VistA
* Double check that ..VER returns the right version on either GTM/Cache
* README update (esp Unit Tests section if updated)
* Changes.md update
* Add Authors/years to License file
* If there are new Authors or modules that came from other projects, add their
  work to the NOTICE file
* git tag the version
* Merge dev branch to master
* Create release notes in a local file for copy pasting later. Notes contain:
  * Install Instructions specific to version
  * Authors
  * Changes for version (copy and paste from Changes.md)
* Upload .RSA file and put release notes
* Submit to the OSEHRA Tech Journal if applicable
