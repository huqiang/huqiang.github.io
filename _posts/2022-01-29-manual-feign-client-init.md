---
layout: post
title: "Manual Feign Client Initialization"
date: 2022-01-29 09:29:09 +0800
---
THe notes to setup [p6spy](https://github.com/p6spy/p6spy) to intercept and log queries without code changes.  
1. Add p6spy library:  
```xml
    <dependency>
        <groupId>p6spy</groupId>
        <artifactId>p6spy</artifactId>
        <version>3.8.1</version>
    </dependency>
```
1. Update the driver and DB link to:  
  * `com.p6spy.engine.spy.P6SpyDriver`  
  * `jdbc:p6spy:mysql:DB_URL`  
1. Add `spy.properties`:  
```cnf
driverlist=com.mysql.jdbc.Driver
logMessageFormat=com.p6spy.engine.spy.appender.SingleLineFormat
dateformat=yyyy-MM-dd HH:mm:ss.SSS

appender=com.p6spy.engine.spy.appender.Slf4JLogger

logfile= spy.log

log4j.appender.Default=org.apache.log4j.RollingFileAppender
log4j.appender.Default.File=spy.log
log4j.appender.Default.MaxFileSize=10MB
log4j.appender.Default.MaxBackupIndex=10
log4j.appender.Default.layout=org.apache.log4j.PatternLayout
log4j.appender.Default.layout.ConversionPattern=[%-28d{yyyy-MM-dd HH:mm:ss,SSS z}] %c %t - %m%n
log4j.appender.Default.Append=true
log4j.logger.p6spy=INFO,Default
```
