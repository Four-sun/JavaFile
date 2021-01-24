/**
 * @Auther: fanshu
 * @Date: 2020/12/16
 * @Description: kafka源表打入mysql结果表--已验证
 */

CREATE TABLE MyTable(
    id int,
    name varchar,
    age int
 )WITH(
    type ='kafka11',
    bootstrapServers ='172.16.100.241:9092',
    zookeeperQuorum ='172.16.100.241:2181/kafka',
    offsetReset ='latest',
    topic ='fanshu10',
    charsetName ='utf-8',
    timezone='Asia/Shanghai',
    updateMode ='append',
    enableKeyPartitions ='false',
    topicIsPattern ='false',
    parallelism ='1'
 );

CREATE TABLE MyResult(
    runoob_id INT,
    runoob_name VARCHAR,
    runoob_age INT
 )WITH(
    type ='mysql',
    url ='jdbc:mysql://172.16.8.193:3306/test',
    userName ='root',
    password = '123456',
    tableName ='runoob_tbl2',
    updateMode ='append',
    parallelism ='1',
    batchSize ='100',
    batchWaitInterval ='1000'
 );

INSERT
INTO
    MyResult
    SELECT
        id AS runoob_id,
        name AS runoob_name,
        age AS runoob_age
    FROM
        MyTable;