Definition

The microservice architectural style is an approach to developing a single application as suite of small services, each running in its own process and communicating with lightweight mechanisms, often an HTTP resource API.

- Martin Fowler

- Separation of Concerns
  - Modularity, Encapsulation
- Scalability
  - Horizontally scaling
  - Workload partitioning
- Virtualization and Elasticity
  - Automated Operations
  - On demand provisioning

Organ Systems
  - Each organ has purpose
  - Organs form systems
  - Systems form an organism

To understand microservice architecture, first we have to understand what are the dis advantages of a monolith architecture.

All components that compose a software 

Inflexible - can't be built with different technologies
Unreliable - The entire system goes down if one part of the system goes down.
Unscalable
Blocks continuous development
slow development
not fit for complex applications

## Advantages

- Deployment Felxibility
- Technology Flexibility
- Can be scaled separately

## Disadvantages

- Deployment / Architecture complexity
  - Separation of Concern
  - Deciding what goes where
- Service Descovery
  - How the microservices communicate with each other
  - How it knows what to contact
  - How are the end points maintained