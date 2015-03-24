## How does it work?

* Two-level scheduling
* Cannot do anything itself with the resources
* Plugins, called frameworks, decides what to do with them
* So all specific handling of different workloads
  are done through the frameworks

Note:

Mesos er en 2-nivå-scheduler, dvs. den vet ikke hva den
skal gjøre med ledige ressurser, men delegerer dette
ansvaret videre til Mesos plugins som blir kalt rammeverk.

Disse rammeverkene blir får tilbud fra Mesos om så og så mye
minne, cpu, disk, osv. Deretter takker de ja eller nei
på disse tilbudene, f.eks. basert på om ressursene ligger
på samme maskin som en tjeneste den trenger tilgang til.

Hvis et rammeverk takker ja, sender det med
hvordan tjenesten skal kjøres, så velger Mesos ut hvor
den skal kjøres.

Derfor trenger ikke Mesos vite om hvordan forskjellige
typer tjenester, f.eks. batch, skal håndteres. Det gjøres
av rammeverkene.
