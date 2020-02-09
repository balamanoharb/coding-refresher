
<!-- TOC -->

- [1. System Design Overview](#1-system-design-overview)
  - [1.1. Scalability](#11-scalability)
    - [1.1.1. Horizontal Scaling vs Vertical Scaling](#111-horizontal-scaling-vs-vertical-scaling)
  - [1.2. Load Balancing](#12-load-balancing)
    - [1.2.1. Tools](#121-tools)
  - [1.3. Asynchrony](#13-asynchrony)
  - [1.4. Message Queues](#14-message-queues)
    - [1.4.1. Message Queues - Usecases](#141-message-queues---usecases)
    - [1.4.2. Message Queuing Tools](#142-message-queuing-tools)
  - [1.5. Monolith vs Microservices](#15-monolith-vs-microservices)
  - [1.6. Database Sharding](#16-database-sharding)
  - [1.7. Caching](#17-caching)
    - [1.7.1. What is caching?](#171-what-is-caching)
    - [1.7.2. Advantages of using Cache](#172-advantages-of-using-cache)
    - [1.7.3. Different strategies of using cache](#173-different-strategies-of-using-cache)
    - [1.7.4. Caching policies](#174-caching-policies)
    - [1.7.5. Strategies for maintaining consistency of data](#175-strategies-for-maintaining-consistency-of-data)
  - [1.8. Designing API's](#18-designing-apis)
  - [1.9. Capacity Estimation / Planning](#19-capacity-estimation--planning)
  - [1.10. Single point of failures](#110-single-point-of-failures)
  - [1.11. NoSQL](#111-nosql)
  - [1.12. Replication in Distributed system](#112-replication-in-distributed-system)
  - [1.13. Distributed Consensus](#113-distributed-consensus)
  - [1.14. Publisher Subscriber Model](#114-publisher-subscriber-model)
  - [1.15. Database as Message Queues - Antipattern](#115-database-as-message-queues---antipattern)
    - [1.15.1. Cons of db as queues](#1151-cons-of-db-as-queues)
    - [1.15.2. Disadvantages of a Message Queue](#1152-disadvantages-of-a-message-queue)
  - [1.16. Event Driven Architecture](#116-event-driven-architecture)
  - [1.17. Handling Failures](#117-handling-failures)
  - [CDN](#cdn)
- [System Design at Scale - Examples](#system-design-at-scale---examples)
  - [Airbnb](#airbnb)
  - [Search Engine](#search-engine)
  - [Netflix](#netflix)
    - [Interview](#interview)
    - [References](#references)
      - [Overview](#overview)
      - [Video Processing and Streaming](#video-processing-and-streaming)
      - [Data at Netflix](#data-at-netflix)
      - [CDN - Openconnect](#cdn---openconnect)
  - [Youtube](#youtube)
  - [Tinder](#tinder)
  - [Whatsapp](#whatsapp)
  - [Instagram Newsfeed](#instagram-newsfeed)
- [2. How to give system design interviews](#2-how-to-give-system-design-interviews)
- [3. Things to consider](#3-things-to-consider)
- [4. Concepts to know](#4-concepts-to-know)
- [5. Tools](#5-tools)
  - [5.1. Note](#51-note)
  - [5.2. Ref](#52-ref)
  - [5.3. Books](#53-books)

<!-- /TOC -->

# 1. System Design Overview


## 1.1. Scalability

- [CS75 - Lecture 9 Scalability - David Malan](https://www.youtube.com/watch?v=-W9F__D3oY4)
- [gkcs - How to start with distributed systems?](https://youtu.be/SqcXvc3ZmRU)
- [Scalability for Dummies blog series](http://www.lecloud.net/tagged/scalability)

### 1.1.1. Horizontal Scaling vs Vertical Scaling

|   Horizontal Scaling            |         Vertical Scaling          |
|---------------------------------|-----------------------------------|
|Needs load balancer to route traffic | N/A                           |
|Network latency (slow)                 | Inter process Communication (slow)|
|Scaling is easy - just add new servers | Has a hard limit on how far it can be extended |
|More resilient                   | Single point of failure |
|Data Consistency is problem           | No Consistency issues   |


## 1.2. Load Balancing

- [gkcs - What is load balancing](https://www.youtube.com/watch?v=K0Ta65OqQkY&feature=youtu.be)
- [citrix - What is load balancing](https://www.citrix.com/en-in/glossary/load-balancing.html)
- [nginx - What is load balancing](https://www.nginx.com/resources/glossary/load-balancing/)
- [gkcs - What is consistent hashing](https://youtu.be/zaRkONvyGr8)
- [Udacity - video - Consistent hashing](https://www.youtube.com/watch?v=viaNG1zyx1g)
- [hackerearth - Basics of Hashing](https://www.hackerearth.com/practice/data-structures/hash-tables/basics-of-hash-tables/tutorial/)
- [Consistent Hashing](http://michaelnielsen.org/blog/consistent-hashing/)
- [Consistent Hashing](http://tom-e-white.com/2007/11/consistent-hashing.html)
- [Topal - Guide to Consistent Hashing](https://www.toptal.com/big-data/consistent-hashing)
- [Consistent Hashing](https://medium.com/system-design-blog/consistent-hashing-b9134c8a9062)
- [Consistetn Hashing Algorithmic tradeoffs](https://medium.com/@dgryski/consistent-hashing-algorithmic-tradeoffs-ef6b8e2fcae8)
- [Sessions and Load balancing](https://stackoverflow.com/questions/10494431/sticky-and-non-sticky-sessions)

### 1.2.1. Tools

- Elastic load balancing by aws

## 1.3. Asynchrony

- [asynchronous vs synchronous HTTP](https://stackoverflow.com/questions/16715380/what-is-the-difference-between-asynchronous-and-synchronous-http-request)
- [asynchronous calls in general](https://www.enterpriseintegrationpatterns.com/patterns/conversation/RequestResponse.html)

## 1.4. Message Queues

- [gkcs - What is Message Queue](https://youtu.be/oUJbuFMyBDk)
- [What is Message Queueing](https://www.cloudamqp.com/blog/2014-12-03-what-is-message-queuing.html)
- [Asynchronous Processing in Web Applications - Part 1](http://blog.codepath.com/2012/11/15/asynchronous-processing-in-web-applications-part-1-a-database-is-not-a-queue/)
- [Asynchronous Processing in Web Applications - Part 2](http://blog.codepath.com/2013/01/06/asynchronous-processing-in-web-applications-part-2-developers-need-to-understand-message-queues/)

### 1.4.1. Message Queues - Usecases

- [Highscalability - Message Queues](http://highscalability.com/blog/2012/12/17/11-uses-for-the-humble-presents-queue-er-message-queue.html)

### 1.4.2. Message Queuing Tools

- [RabbitMQ](https://www.rabbitmq.com/getstarted.html)
- [Kafka]()
- [Zero MQ]()

## 1.5. Monolith vs Microservices

- [gkcs - Monolith vs Microservice](https://youtu.be/qYhRvH9tJKw)
- [Should you start with monolith always](https://buttercms.com/books/microservices-for-startups/should-you-always-start-with-a-monolith)
- [Monolith vs Microservice architecture](https://articles.microservices.com/monolithic-vs-microservices-architecture-5c4848858f59)
- [Highscalability - Do you have too many microservices](http://highscalability.com/blog/2018/4/5/do-you-have-too-many-microservices-five-design-attributes-th.html)
- [Matt Ranney - Learnings from Uber microservice architecture](https://www.youtube.com/watch?v=kb-m2fasdDY)
- [8bitmen - Uber insights](https://www.8bitmen.com/an-insight-into-how-uber-scaled-from-a-monolith-to-a-microservice-architecture/)
- [Mastering Chaos - A Netflix Guide to Microservices](https://www.youtube.com/watch?v=CZ3wIuvmHeM)
- [Design Microservice Architectures the Right Way](https://www.youtube.com/watch?v=j6ow-UemzBc)
- [Mircroservice - A Retrospective](https://www.youtube.com/watch?v=DLRfT44e8uQ)

## 1.6. Database Sharding

- [gkcs - What is database sharding?](https://youtu.be/5faMjKuB9bc)
- [What are horizontal and vertical partitions in database and what is the difference? - Stack Overflow](https://stackoverflow.com/questions/18302773/what-are-horizontal-and-vertical-partitions-in-database-and-what-is-the-differen)
- [How Sharding Works - Jeeyoung Kim - Medium](https://medium.com/@jeeyoungk/how-sharding-works-b4dec46b3f6)
- [Why I love databases - Jeeyoung Kim - Medium](https://medium.com/@jeeyoungk/why-i-love-databases-1d4cc433685f)
- [What is the difference between consistent hashing and sharding in a distributed system? - Quora](https://www.quora.com/What-is-the-difference-between-consistent-hashing-and-sharding-in-a-distributed-system)
- [Partition (database) - Wikipedia](https://en.wikipedia.org/wiki/Partition_(database))

## 1.7. Caching

### 1.7.1. What is caching?

- [Gauva - google caching library](https://github.com/google/guava/wiki/CachesExplained)

### 1.7.2. Advantages of using Cache

- Avoid network calls
- Reduce DB load

### 1.7.3. Different strategies of using cache

- In memory vs Global cache

### 1.7.4. Caching policies

- [highscalability - design of a modern cache](http://highscalability.com/blog/2016/1/25/design-of-a-modern-cache.html)
- [LRU](http://www.mathcs.emory.edu/~cheung/Courses/355/Syllabus/9-virtual-mem/LRU-replace.html)
- [Sliding window implementation - caffeine library](https://github.com/ben-manes/caffeine)
- [Different cache replacement policies](https://en.wikipedia.org/wiki/Cache_replacement_policies)

### 1.7.5. Strategies for maintaining consistency of data

- [write through, write around and write back](https://shahriar.svbtle.com/Understanding-writethrough-writearound-and-writeback-caching-with-python)

## 1.8. Designing API's

- [gkcs - designing apis](https://youtu.be/_YlYuNMTCc8)
- [Swagger API specs](https://swagger.io/docs/specification/about/)
- Naming - The name should define what it does
- Parameter list
- What should be the route(path)
- maintaining versions
- Responsibility of the action
- Defining proper http verb
- Response object definition - it should have only what's necessary
- using error codes
- single responsibility - avoid doing everything and maintain atomicity
- pagination
- no side effects
- should be stateless
- Does perfect consistency matter ? (cached, uncached)

## 1.9. Capacity Estimation / Planning

- [gkcs - capacity estimation - how much data does youtube store daily](https://youtu.be/0myM0k1mjZw)
- [A quick how-to on capacity planning for an application deployed in AWS: Laxmi Nagarajan](https://www.youtube.com/watch?v=-3qetLv2Yp0)
- [wikipedia - back of the envelope calculation](https://en.wikipedia.org/wiki/Back-of-the-envelope_calculation)
- [Jeffrey Dean - Building Software Systems At Google and Lessons Learned](https://www.youtube.com/watch?v=modXC5IWTJI)
- [Seattle Conference on Scalability: YouTube Scalability](https://www.youtube.com/watch?v=w5WVu624fY8)
- [Scalability at YouTube](https://www.youtube.com/watch?v=G-lGCC4KKok)
- [High scalability - youtube architecture](http://highscalability.com/youtube-architecture)

## 1.10. Single point of failures

- [gkcs - System Design: How to avoid single points of failure](https://youtu.be/-BOysyYErLY)
- [Oracle docs - Single point of failure](https://docs.oracle.com/cd/E19693-01/819-0992/fjdch/index.html)
- [Stackoverflow - High availability](https://stackoverflow.com/questions/7943211/web-app-high-availability-how-to-prevent-a-single-point-of-failure)
- [IEEE exploer - Eliminating single point of failures](https://ieeexplore.ieee.org/document/6214760)
- [How to Deal with Single Points of Failure: Software](http://www.spkaa.com/blog/how-to-deal-with-single-points-of-failure-software/)
- [wikipedia - single point of failures](https://en.wikipedia.org/wiki/Single_point_of_failure)

## 1.11. NoSQL

- [gkcs - Introduction to NoSQL databases](https://youtu.be/xQnIN9bW0og)
- [cassandra architecture](https://docs.datastax.com/en/archived/cassandra/3.0/cassandra/architecture/archTOC.html)
- [SSTable compaction and compaction strategies](https://github.com/scylladb/scylla/wiki/SSTable-compaction-and-compaction-strategies)

## 1.12. Replication in Distributed system

- [gkcs - Data Replication strategies on the server](https://www.youtube.com/watch?v=GeGxgmPTe4c)

## 1.13. Distributed Consensus

- 2PC (2 phase commit)
- 3PC (3 phase commit)
- MVCC (Multi Version Concurrency Control - used by Postgres)
- SAGA (used by microsoft in HALO game)
- Paxos (used by Google in Chubby distributed lock services)
- Raft (alternative to Paxos)

## 1.14. Publisher Subscriber Model

- [gkcs - what is pub sub model](https://youtu.be/FMhbR_kQeHw)
- [gkcs - How messaging can be disastrous](https://youtu.be/dGXHHABFGnk)
- [oracle docs - using pub-sub model](https://docs.oracle.com/cd/B10501_01/appdev.920/a96590/adg15pub.htm)
- [aws docs - pub-sub messaging](https://aws.amazon.com/pub-sub-messaging/)
- [wikipedia - publisher subscriber pattern](https://en.wikipedia.org/wiki/Publish%E2%80%93subscribe_pattern)

## 1.15. Database as Message Queues - Antipattern

- [gkcs](https://youtu.be/9T-gNZ5bGCw)
- [codepath - A Database Is Not a Queue](http://blog.codepath.com/2012/11/15/asynchronous-processing-in-web-applications-part-1-a-database-is-not-a-queue/)
- [codepath - Developers Need To Understand Message Queues](http://blog.codepath.com/2013/01/06/asynchronous-processing-in-web-applications-part-2-developers-need-to-understand-message-queues/)
- [Why database as queue so bad?](https://softwareengineering.stackexchange.com/questions/231410/why-database-as-queue-so-bad)
- [Database as Message Queues - Antipattern](http://mikehadlow.blogspot.com/2012/04/database-as-queue-anti-pattern.html)
- [Database not the right tool for Q](https://www.cloudamqp.com/blog/2015-11-23-why-is-a-database-not-the-right-tool-for-a-queue-based-system.html)

### 1.15.1. Cons of db as queues

1. Polling intervals have to be set correctly. Too long makes the system is inefficient. Too short makes the database undergo heavy read load.
2. Read and write operation heavy DB. Usually, they are good at one of the two.
3. Manual delete procedures to be written to remove read messages.
4. Scaling is difficult conceptually and physically.

### 1.15.2. Disadvantages of a Message Queue

1. Adds more moving parts to the system.
2. Cost of setting up the MQ along with training is large.
3. Maybe be overkill for a small service.

## 1.16. Event Driven Architecture

- [gkcs - event driven systems]()
- [GOTO 2017 • The Many Meanings of Event-Driven Architecture • Martin Fowler](https://www.youtube.com/watch?v=STKCRSUsyP0)
- [Martinfowler blog - Event Driven](https://martinfowler.com/articles/201701-event-driven.html)
- [wikipedia - event driven architecture](https://en.wikipedia.org/wiki/Event-driven_architecture)
- [microservices.io - Event driven Pattern or Saga pattern](https://microservices.io/patterns/data/event-driven-architecture.html)

## 1.17. Handling Failures

- [gkcs - Recovering from failures](https://www.youtube.com/watch?v=lWE_UIbm8NA&list=PLMCXHnjXnTnvo6alSjVkgxV-VH6EPyvoX&index=22)
- [Patterns for Resilient Architecture - Part 1](https://medium.com/@adhorn/patterns-for-resilient-architecture-part-1-d3b60cd8d2b6)
- [Patterns for Resilient Architecture - Part 2](https://medium.com/@adhorn/patterns-for-resilient-architecture-part-2-9b51a7e2f10f)
- [Patterns for Resilient Architecture - Part 3](https://medium.com/@adhorn/patterns-for-resilient-architecture-part-3-16e8601c488e)
- [Patterns for Resilient Architecture - Part 4](https://medium.com/@adhorn/patterns-for-resilient-architecture-part-4-85afa66d6341)
- [Netflix blog - Active-Active for Multi-Regional Resiliency](https://netflixtechblog.com/active-active-for-multi-regional-resiliency-c47719f6685b)

## CDN

- [GOTO 2016 • What is a CDN and why Developers should Care about using one • Artur Bergman](https://www.youtube.com/watch?v=farO15_0NUQ)

# System Design at Scale - Examples

## Airbnb

- [Building Services at Airbnb, Part 1](https://medium.com/airbnb-engineering/building-services-at-airbnb-part-1-c4c1d8fa811b)
- [Building Services at Airbnb, Part 2](https://medium.com/airbnb-engineering/building-services-at-airbnb-part-2-142be1c5d506)
- [Building Services at Airbnb, Part 3](https://medium.com/airbnb-engineering/building-services-at-airbnb-part-3-ac6d4972fc2d)
- [InfoQ - Scaling airbnb](https://www.infoq.com/presentations/airbnb-services-scalability/)

## Search Engine

- [stackexchange - how would you implement google search](https://softwareengineering.stackexchange.com/questions/38324/how-would-you-implement-google-search)
- [search engine design](https://xunhuanfengliuxiang.gitbooks.io/system-desing/search-engine.html)
- [Cliqz - A new search engine](https://0x65.dev/blog/2019-12-05/a-new-search-engine.html)
- [Cliqz - Building a search engine from scratch](https://0x65.dev/blog/2019-12-06/building-a-search-engine-from-scratch.html)
- [Cliqz - Human Web—Collecting data in a socially responsible manner](https://0x65.dev/blog/2019-12-03/human-web-collecting-data-in-a-socially-responsible-manner.html)

## Netflix

### Interview

- [Tech Dummies - Netflix system design](https://medium.com/@narengowda/netflix-system-design-dbec30fede8d)
- [gkcs - Onboarding new content](https://youtu.be/x9Hrn0oNmJM)
- [packt - how netflix migrated to microservice](https://hub.packtpub.com/how-netflix-migrated-from-a-monolithic-to-a-microservice-architecture-video/)

### References

#### Overview

- [An intro to netflix stack](https://www.youtube.com/watch?v=8iWNUVe346o)
- [highscalability - What happens when you click play](http://highscalability.squarespace.com/blog/2017/12/11/netflix-what-happens-when-you-press-play.html)
- [highscalability - A 360 Degree View Of The Entire Netflix Stack](http://highscalability.com/blog/2015/11/9/a-360-degree-view-of-the-entire-netflix-stack.html)

#### Video Processing and Streaming

- [Netflix tech blog - High Quality Video Encoding at Scale](https://netflixtechblog.com/high-quality-video-encoding-at-scale-d159db052746)
- [Netflix tech blog - Optimized storage for streaming - shot-based encodes](https://netflixtechblog.com/optimized-shot-based-encodes-now-streaming-4b9464204830)
- [Netflix tech blog - Keystone Real-time Stream Processing Platform](https://netflixtechblog.com/keystone-real-time-stream-processing-platform-a3ee651812a)

#### Data at Netflix

- [Netflix tech blog - Netflix’s Viewing Data](https://netflixtechblog.com/netflixs-viewing-data-how-we-know-where-you-are-in-house-of-cards-608dd61077da)
- [Delivering High Quality Analytics at Netflix](https://youtu.be/nMyuCdqzpZc)

#### CDN - Openconnect

- [Netflix - Quick Guide: What Is Netflix Open Connect | Netflix](https://www.youtube.com/watch?v=sExZim0S8nk)
- [Designing Netflix's Content Delivery System: Symposium 2014](https://www.youtube.com/watch?v=LkLLpYdDINA)
- [Building Open Connect, a large scale content delivery network for Netflix (CAIA Research Seminars)](https://www.youtube.com/watch?v=mBCXdaukvcc)
- [Scaling the Netflix Global CDN, lessons learned from Terabit Zero](https://www.youtube.com/watch?v=tbqcsHg-Q_o)
- [Netflix Open Connect: Starting from a Greenfield 2015](https://www.youtube.com/watch?v=pb4PsAkBdH8)
- ["Caching at Netflix: The Hidden Microservice" by Scott Mansfield](https://www.youtube.com/watch?v=Rzdxgx3RC0Q)
- [Netflix and FreeBSD Using Open Source to Deliver Streaming Video](https://www.youtube.com/watch?v=vcyQBup-Gto)
- [Netflix - working with isps](https://media.netflix.com/en/company-blog/how-netflix-works-with-isps-around-the-globe-to-deliver-a-great-viewing-experience)
- [Netflix - Openconnect](https://openconnect.netflix.com/en_gb/)

- [nginx - Microservices at netflix](https://www.nginx.com/blog/microservices-at-netflix-architectural-best-practices/)
- [InfoQ - Netflix play API](https://www.youtube.com/watch?v=6oPj-DW09DU)
- [Netflix play API Slides](https://www.slideshare.net/SuudhanRangarajan/netflix-play-api-why-we-built-an-evolutionary-architecture)
- [GOTO 2016 • Microservices at Netflix Scale: Principles, Tradeoffs & Lessons Learned • R. Meshenberg](https://youtu.be/57UK46qfBLY)
- [GOTO 2016 • Chaos & Intuition Engineering at Netflix • Casey Rosenthal](https://youtu.be/Q4nniyAarbs)

- [Mastering Chaos - A Netflix Guide to Microservices](https://www.youtube.com/watch?v=CZ3wIuvmHeM&t=1324s)

## Youtube

- [Geeks for Geeks](https://www.geeksforgeeks.org/design-video-sharing-system-like-youtube/)

## Tinder

- [System Design: Tinder as a microservice architecture](https://youtu.be/tndzLznxq40)

## Whatsapp

- [Whatsapp: System Design](https://youtu.be/vvhC64hQZMk)

## Instagram Newsfeed

- [Designing Instagram: System Design of News Feed](https://youtu.be/QmX2NPkJTKg)

# 2. How to give system design interviews

- [How not to do in a system design interview](https://hackernoon.com/how-not-to-design-netflix-in-your-45-minute-system-design-interview-64953391a054)
- Rule 1: Reading High Scalability a night before your interview does not make you an expert in Distributed Systems
- Rule 2: Never pretend to be an expert. The person interviewing you almost always understands the domain better than you and can even be an industry expert.
- Rule 3: Don’t rush to a solution. Gather requirements, suggest multiple solutions and evaluate them. It is meant to be an open-ended discussion.
- A - Ask good questions 
    - get the minimum viable requirements for the product/design
    - get the minimal feature set
    - how much to scale i.e how much user base
- B - Don't use buzzwords
    - without knowing anything about NoSQL don't talk about it
    - don't talk about stuff you have just read and not practiced
- C - Clear and organized thinking
    - layout the highlevel apis and interfaces before diving deep
- D - Drive discussions with 80-20 rule
    -  80% of the time you should be one leading the discussion
- Don't jump into details prematurely. Pause for feedbacks and define the high level components.
- Don't fit pre built architectures (like pub-sub, event driven).
- KISS - keep it simple stupid.
- Don't make points without justifications. why nosql? avoid speaking without thinking things through
- Be specific about the tech
    - load balancer - aws elastic load balancer
    - database - mysql, postgres, mongo DB, dynamo DB
    - message q - rabbit mq

# 3. Things to consider

- Features
- API
- Availability
- Latency
- Scalability
- Durability
- Class Diagram
- Security and Privacy
- Cost-effective

# 4. Concepts to know

- Vertical vs horizontal scaling
- CAP theorem
- ACID vs BASE
- Partitioning/Sharding 
- Consistent Hashing
- Optimistic vs pessimistic locking
- Strong vs eventual consistency
- RelationalDB vs NoSQL
- Types of NoSQL
    - Key value
    - Wide column
    - Document-based
    - Graph-based
- Caching
- Data center/racks/hosts
- CPU/memory/Hard drives/Network bandwidth
- Random vs sequential read/writes to disk
- HTTP vs http2 vs WebSocket
- TCP/IP model
- ipv4 vs ipv6
- TCP vs UDP
- DNS lookup
- Http & TLS
- Public key infrastructure and certificate authority(CA)
- Symmetric vs asymmetric encryption
- Load Balancer
- CDNs & Edges
- Bloom filters and Count-Min sketch
- Paxos 
- Leader election
- Design patterns and Object-oriented design
- Virtual machines and containers
- Pub-sub architecture 
- MapReduce
- Multithreading, locks, synchronization, CAS(compare and set)

# 5. Tools

- Cassandra
- MongoDB/Couchbase
- Mysql
- Memcached
- Redis
- Zookeeper
- Kafka
- NGINX
- HAProxy
- Solr, Elastic search
- Amazon S3
- Docker, Kubernetes, Mesos
- Hadoop/Spark and HDFS

1. [HiredInTech on System Design](https://www.hiredintech.com/system-design/)
1. Palantir's Blog
     - [How to Ace a System Design Interview](https://www.palantir.com/2011/10/how-to-ace-a-systems-design-interview/)
     - [Someother post](http://web.archive.org/web/20160313091215/https://www.palantir.com/2009/05/bandwidth-isnt-cheap-disk-isnt-cheap-cpu-isnt-cheap/)
1. Some posts on reddit: [1](https://www.reddit.com/r/cscareerquestions/comments/30y89g/how_do_you_answer_interview_questions_on_large/), [2](https://www.reddit.com/r/cscareerquestions/comments/4thln8/would_someone_be_able_to_solve_questions_like_the/d5hx00a), [3](https://www.reddit.com/r/coding/comments/4vm20l/heres_how_architecture_interviews_at_tech/), [4](https://www.reddit.com/r/cscareerquestions/comments/3sm85j/how_to_answer_tech_interview_questions_regarding/), [5](https://www.reddit.com/r/cscareerquestions/comments/3tzhyp/what_are_uber_onsite_interviews_like/cxashic)
1. [Quora: How do I prepare to answer design questions?](https://www.quora.com/How-do-I-prepare-to-answer-design-questions-in-a-technical-interview)
1. [This repo with tons of links](https://github.com/checkcheckzz/system-design-interview) and here is [another one](https://github.com/shashank88/system_design) and [another one](https://github.com/jdsutton/Technical-Interview-Megarepo/tree/master/System%20Design)
1. 
1. [Reddit Scaling playlist](https://www.youtube.com/watch?v=pjNTgULVVf4&list=PLVi1LmRuKQ0NINQfjKLVen7J2lZFL35wP&index=1)
1. [The Architecture Interview](http://www.susanjfowler.com/blog/2016/10/7/the-architecture-interview)
1. [Gainlo blog](http://blog.gainlo.co/)
1. [MongoDB article on NoSQL](https://www.mongodb.com/nosql-explained)
1. [MIT course on Distributed Systems](http://web.mit.edu/6.033/www/)
1. [A plain English introduction into CAP theorem](http://ksat.me/a-plain-english-introduction-to-cap-theorem/)
1. [How to beat the CAP theorem by Nathan Marz](http://nathanmarz.com/blog/how-to-beat-the-cap-theorem.html)
1. [Consistent Hashing Algorithm Explained](https://ihong5.wordpress.com/2014/08/19/consistent-hashing-algorithm/)
1. [Latency Numbers Every Programmer Should Know](https://gist.github.com/jboner/2841832)
1. [InterviewBit questions on System Design](https://www.interviewbit.com/courses/system-design/)
1. [High Scalability All Time Favorites](http://highscalability.com/all-time-favorites/) and other their articles, top stuff
1. [The Architecture of Open Source Applications Book](http://aosabook.org/en/index.html)
1. https://medium.com/system-design-blog
1. https://gist.github.com/vasanthk/485d1c25737e8e72759f

## 5.1. Note

- first two for beginners, last two for experienced

## 5.2. Ref
- [Reddit Thread](https://www.reddit.com/r/cscareerquestions/comments/5u825g/resources_on_learning_system_design_and_data/)

## 5.3. Books

http://book.mixu.net/distsys/single-page.html
https://learning.oreilly.com/library/view/designing-data-intensive-applications/9781491903063/
https://web.mit.edu/alexmv/6.037/sicp.pdf

https://github.com/donnemartin/system-design-primer