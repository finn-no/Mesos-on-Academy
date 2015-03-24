## Simple demo

<iframe style="width: 100%; height: 15em;" src="http://mesosphere.io/simulator/"></iframe>

Note:

I motsetning til den manuelle måten å dele opp ressurser på,
gjør Mesos dette helt dynamisk ettersom hvor det er ledig
kapasitet. Den takler også feil med maskiner, etc. på en god
måte, ved å flytte tjenester fra den feilende maskinen til
en annen maskin.

Siden Mesos dynamisk tildeler ressurser, blir det veldig
enkelt å starte nye tjenester. Man trenger ikke sette opp
nye maskiner eller vite hvilke maskiner som kanskje har
ledig kapasitet, men bare pushe en beskrivelse av
appen til Mesos så tar den seg av å starte den opp.

Fordelen med Mesos ift f.eks. YARN for Hadoop-verdenen
eller Kubernetes fra Google, er at den kan la mange
forskjellige typer tjenester dele på de samme ressursene,
f.eks. Kafka, Cassandra, web-apper, batch, bygg-agenter.
