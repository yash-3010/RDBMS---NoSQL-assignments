# NoSQL and SQL

## **Question 1: Answer**

Redis, which stands for Remote Dictionary Server, is an open-source in-memory data structure store that is commonly used as a database, cache, and message broker. Here are the main features of Redis:

1. In-Memory Data Storage: Redis stores data primarily in memory, which allows for extremely fast read and write operations. This makes it suitable for applications that require low-latency data access.

2. Persistence: Redis allows you to persist data to disk, providing durability even in the event of a system restart. It offers different persistence options, such as snapshotting and append-only file (AOF) persistence.

3. Replication and High Availability: Redis supports master-slave replication, where data from a master Redis instance is asynchronously replicated to one or more slave instances. This provides fault tolerance and high availability.

4. Cluster Mode: Redis Cluster allows you to distribute your data across multiple Redis nodes in a cluster, providing scalability and automatic sharding. It provides a way to horizontally scale Redis by partitioning the data across multiple nodes.

5. Lua Scripting: Redis has built-in support for Lua scripting, which allows you to execute complex operations on the server side. Lua scripts can be executed atomically, enabling you to perform multiple operations as a single transaction.

6. TTL and Key Expiration: Redis allows you to set a time-to-live (TTL) for keys, after which they are automatically deleted. This is useful for implementing caching and time-limited data storage.

7. Atomic Operations: Redis provides atomic operations on various data structures, ensuring that operations are executed indivisibly. This guarantees consistency and avoids race conditions in concurrent environments.

8. Built-in Cache Functionality: Redis is commonly used as a cache due to its fast access times. It supports features like automatic cache eviction based on policies such as LRU (Least Recently Used), LFU (Least Frequently Used), and more.

#
#
## **Question 2: Answer**

Here are some of the limitations of Redis:

1. Limited Storage Capacity: Since Redis primarily stores data in memory, the storage capacity is limited by the amount of RAM available on the server. If the dataset exceeds the available memory, it can lead to performance issues or the need to shard the data across multiple Redis instances.

2. Lack of Complex Querying: Redis is not designed for complex querying or searching of data. While it provides efficient operations on individual keys or small sets of keys, it does not have built-in support for advanced querying capabilities like SQL or NoSQL databases.

3. Disk Persistence Trade-offs: Although Redis offers persistence options to save data to disk, it involves trade-offs. Snapshotting requires periodically saving the entire dataset to disk, which can be resource-intensive for large datasets. Append-only file (AOF) persistence provides more granular updates but can lead to larger disk space usage.

4. Single-Threaded Architecture: Redis runs on a single thread, which means it can handle only one request at a time. While this simplifies the implementation and ensures data consistency, it can limit the overall throughput and performance in scenarios with high concurrency or CPU-bound operations.

5. Lack of Transactions Across Multiple Keys: Redis provides transactions, but they are limited to operations on a single key. If you need to perform atomic operations across multiple keys, Redis does not offer built-in support for distributed transactions.

6. No Native Secondary Indexes: Redis does not provide native support for secondary indexes. If you need to query data based on multiple attributes, you may need to implement custom indexing or consider using an additional indexing service.

## **Question 3: Answer**

_I have used **Node.js** for performing basic crud operatios using redis as database._

* First you need to install Redis using npm on node.js to perform the following commands.

```javascript Javascript
const redis = require('redis');
const client = redis.createClient();

// Create a key-value pair
client.set('name', 'Yash Barman');

// Get the value of the key
const name = client.get('name');
console.log(name); // Yash Barman

// Update the value of the key
client.set('name', 'Y barman');

// Delete the key-value pair
client.del('name');

// Check if the key exists
const exists = client.exists('name');
console.log(exists); // false
```
#
#

## **Question 4: Answer**
TTL stands for Time To Live. It is a command that is used to set a time limit for a key in Redis. Once the time limit is reached, the key will be deleted automatically.

The TTL command is a useful way to ensure that your data is not stored in Redis for too long. This can help to improve the performance of your Redis database and prevent it from becoming cluttered with old data.

**Example**

```javascript javascript
const redis = require('redis');
const client = redis.createClient();

// Set the TTL for the key `name` to 1 day (you have to set the time in seconds)
client.ttl('name', 1 * 86400);

// Get the remaining time to live for the key `name`
const remainingTimeToLive = client.ttl('name');
console.log(remainingTimeToLive); // 1 day 0:00:00

```
## **Question 5: Answer**

_I have used **Node.js** for performing basic crud operatios using redis as database._

* First you need to install Redis using npm on node.js to perform the following commands.

```javascript
const redis = require('redis');
const client = redis.createClient();

const main = async () => {
  // Create two keys in a single line and one key differently. (one value
  // should be number)
  await client.multi();
  await client.set('first_name', 'yash');
  await client.set('last_name', 'barman');
  await client.set('age', 22);

  // Read any two value in a single line
  const value1 = await client.get('first_name');
  const value2 = await client.get('last_name');

  // Increment the number value
  await client.incr('age');

  // Expire any two keys after some time
  await client.expire('first_name', 10000);
  await client.expire('last_name', 10000);

  // Execute the transaction
  const results = await client.exec();

  console.log(results);
};

main();

```

This code will first create two keys, **first_name** and **second_name**, with the values **yash** and **barman**, respectively. Then, it will create a third key, **age**, with the value **22**. Next, it will increment the value of **age** by **1**. Finally, it will expire the keys **first_name** and **second_name** after 10000 milliseconds (10 seconds).