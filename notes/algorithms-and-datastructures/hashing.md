- SHA-1
- MD5
- MurmurHash
- [xxHash](https://github.com/cespare/xxhash)
- [MetroHash](https://github.com/dgryski/go-metro)
- [SipHash1-3](https://github.com/dgryski/go-sip13)
- [Consistent Hashing and Random Trees: Distributed Caching Protocols for Relieving Hot Spots on the World Wide Web](https://www.akamai.com/es/es/multimedia/documents/technical-publication/consistent-hashing-and-random-trees-distributed-caching-protocols-for-relieving-hot-spots-on-the-world-wide-web-technical-publication.pdf)
- [Last.fm's Ketama memcached client](https://www.last.fm/user/RJ/journal/2007/04/10/rz_libketama_-_a_consistent_hashing_algo_for_memcache_clients)
- [Amazon's Dynamo](https://www.allthingsdistributed.com/files/amazon-dynamo-sosp2007.pdf)

consistent Hashing

You can think of the circle as all integers 0 ..2³²-1. The basic idea is that each server is mapped to a point on a circle with a hash function. To lookup the server for a given key, you hash the key and find that point on the circle. Then you scan forward until you find the first hash value for any server.