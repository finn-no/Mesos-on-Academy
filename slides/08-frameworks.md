## Mesos Frameworks

### Marathon, Kubernetes, Chronos, Kafka, Cassandra, Spark, Storm, Hadoop, Deis, Jenkins...

Note:

Her har vi noen av rammeverkene som finnes til Mesos.

Marathon brukes for å kjøre vanlige langt-kjørende tjenester
som frontend, api, etc.

Kubernetes fra Google er tilsvarende, men har mer faste rammer
på hvordan dette skal gjøres.

Chronos er en distribuert cron, har støtte for deps mellom
cron-jobber og god feilhåndtering.

Deis er en open source Heroku-clone, mer eller mindre.

Det er også mulighet til å sette opp hvordan ressursene skal
fordeles mellom rammeverkene, f.eks. så vil en ikke at noen
veldig ressurskrevende bygge-jobber skal kvele produksjon.
