
--



Ok, men dårlig utnyttelse av serverne, bare manuelt oppsett
... (sjekk hvorfor VMs ble tatt i bruk)

Så nå har du bedre utnyttelse av maskinene, men med VMer er det også
ganske stort overhead. I tillegg har du fått mange flere maskiner
som må håndteres manuelt.

En annen ting er feilhåndtering, altså på maskin-nivå. Faller alle maskiner
som kjører en oppgave ut, så blir man fort ganske stresset. Og selv om bare noen
av maskinene faller ut, så vil mest sannsynlig oppgaven slite.

Tar lang tid å rulle ut nye tjenester; utvikling begynner på maskin-nivå


Ikke uhørt å doble utnyttelsesgraden ved å bruke systemer som Mesos.

Google bruker tilsvarende system som Mesos for å kjøre sin cloud

oppgavene er isolerte fra hverandre, enten via Linux' cgroups eller Docker containere

--

hvorfor bruke mesos når en har kubernetes?
  - flere typer oppgaver (batch, services, hadoop, storm, etc) kan kjøre på samme servere dynamisk
  - kan kubernetes fordele oppgaver enkelt utover?
  - kan kubernetes håndtere at maskiner faller ut og så sende oppgavene til andre maskiner?
hvordan slår en opp mesos-cassandra?
ha med mesos-jenkins


# more

reduces operational complexity, and makes developers more productive.

highly-elastic, highly-available and fault-tolerant.

Apache Mesos is a cluster manager that provides efficient resource isolation and sharing across distributed applications or frameworks. It can run Hadoop, MPI, Chronos, Spark and other applications on a dynamically shared pool of nodes. Prominent users of Mesos include Twitter, Airbnb, MediaCrossing, Xogito and Categorize. Mesos leverages features of the modern kernel – “cgroups” in Linux, “zones” in Solaris – to provide isolation for CPU, memory, I/O, file system (in progress), rack locality, etc. The big idea is to make a large collection of heterogeneous resources appear as if they were one big computer. In that sense, Mesos is similar to Google’s “Borg” and “Omega” projects for warehouse-scale computing. - See more at: http://typesafe.com/blog/play-framework-grid-deployment-with-mesos#sthash.IhrUJ4HA.dpuf

mesos frameworks:
dns
hfds
marathon
Elastic Search
cassandra
kubernetes


# What is Mesos?

* Handle the data center as one big pool of resources

image-> many machines into one big

Note:
Tenk deg at du har en haug med datamaskiner, bedre kjent som et datasenter
Hadde det ikke vært mye greiere om

--

# What is Mesos?

* Run tasks on this big pool of resources
* Tasks can be of different types (batch, services, etc.)

image-> many machines with different colours depending on which type of task

--

# What is Mesos?

* "two-phase" scheduler??

--

# We are doing micro-services...piece of cake

## Problems?

- A lot of manual work now
- automation, how?
- scheduling (does everything belong here?)
  - where to run services
  - how many/scaling
  - handle crashes
  - etc. (see Kubernetes/Marathon features)
- Service discovery
-

## Life without Mesos

Static partitioning is bad
- running several specialized clusters, each at low utilization rates
- long time to ramp up new services
- hard to utilize machines

Static partitioning does not scale
- hard to scale elastically

Failures == Downtime
- hard to deal with failures

Prior practice for a datacenter

1. Dedicated servers
   - low utilization rates
   - longer time to ramp up new services

2. Provisioned VMs
   - even more machines to manage
   - substantial performance decrease due to virtualization

   2a. Static partitioning
       - static partitioning limits elasticity

3. Mesos - one large pool of resources

## Mesos - data center "kernel"

- 10.000s of nodes
- Fault-tolerant replicated master/slaves using ZooKeeper
- Supports Docker
- Native isolation between tasks
  - cgroups
  - docker
- Multi-resource scheduling
- REST APIs for managing config and jobs
- Web UI shows cluster state

- Running mixed workloads -->
  - higher utilization rates
  - fewer resources needed
  - fewer machines needed
  - higher fault tolerance
  - easier/faster to ramp up new services

## Frameworks

what it is?
- kinda distributed system

All of them should (?)
- run processes simultaneously (distributed)
- handle process failures (fault-tolerance)
- optimize execution (elasticity, scheduling)

examples:

for (long) running services, aka distributed init system
- Marathon
  - constraints, a whole lot of them
- Kubernetes

for batch
- Chronos

Other
- Spark
- kafka (https://github.com/stealthly/kafka-mesos)
- storm
- hadoop
- cassandra??


## Quick Overview – Mesos 101 Condensed At its core, Mesos is a focused, scalable, two-phased meta-scheduler that provides primitives to express a wide variety of scheduling patterns and use cases. Solutions are written atop of Mesos as frameworks. Frameworks are targeted for a particular use case, and maintain domain specific information. By remaining focused at its core, Mesos is not architecturally encumbered by domain specific problems that often exist in other monolithic schedulers.
