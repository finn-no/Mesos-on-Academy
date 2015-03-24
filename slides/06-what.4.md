## What is Mesos?

* Open source Apache project
* 10.000s of nodes
* Native isolation between tasks
   * cgroups
   * Docker
* REST-based API for managing config and jobs
* Admin Web UI showing cluster state

Note:

Mesos skalerer bra med masse maskiner og
har støtte for Docker, slik at tjenestene
kjøres opp isolert fra hverandre. Den får
til isolasjon uten å bruke Docker også, da den
bruker teknologien som Docker bruker for
dette, cgroups, direkte.

Den har et REST-basert API for å endre config
og deploye tjenester og et web gui for admin.
