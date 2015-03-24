## What is Mesos?

* Highly-elastic, highly-available and fault-tolerant
* Makes it very easy to deploy new services
* Can mix different types of workloads on the same machines

<image src="images/system_setup.png"/>

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

Her er et eksempel på installasjon av Mesos, med 3 mastere
som er koblet sammen vha ZooKeeper og flere Mesos slaver som
kjører på maskinene som skal kjøre tjenestene. Disse slavene
kan også kjøre på tvers av datasentre og public clouds.
