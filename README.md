# falcon-time-example

```
brg@AMacbook falcon-time-example % ruby -v
ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [arm64-darwin21]

...

      System Version: macOS 13.1 (22C65)
      Kernel Version: Darwin 22.2.0
```

```
brg@AMacbook falcon-time-example % bundle exec falcon serve -b http://0.0.0.0:9292                     
  0.0s     info: Falcon::Command::Serve [oid=0x758] [ec=0x76c] [pid=56786] [2023-02-22 10:01:59 +0300]
               | Falcon v0.42.3 taking flight! Using Async::Container::Forked {:count=>8}.
               | - Binding to: #<Falcon::Endpoint http://0.0.0.0:9292/ {}>
               | - To terminate: Ctrl-C or kill 56786
               | - To reload configuration: kill -HUP 56786
               ...
```

### ab with Time

```
brg@AMacbook falcon-time-example % wrk http://localhost:9292 

Concurrency Level:      10
Time taken for tests:   15.309 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      6400 bytes
HTML transferred:       300 bytes
Requests per second:    6.53 [#/sec] (mean)
Time per request:       1530.931 [ms] (mean)
Time per request:       153.093 [ms] (mean, across all concurrent requests)
Transfer rate:          0.41 [Kbytes/sec] received
```

### ab with DateTime 

```
brg@AMacbook falcon-time-example % wrk http://localhost:9292 
Concurrency Level:      10
Time taken for tests:   0.189 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      6400 bytes
HTML transferred:       300 bytes
Requests per second:    529.08 [#/sec] (mean)
Time per request:       18.901 [ms] (mean)
Time per request:       1.890 [ms] (mean, across all concurrent requests)
Transfer rate:          33.07 [Kbytes/sec] received
```

### wrk with Time

```
brg@AMacbook falcon-time-example % wrk -d 10 http://localhost:9292
Running 10s test @ http://localhost:9292
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    14.54ms    5.94ms  90.91ms   72.69%
    Req/Sec   348.51     46.17   440.00     67.00%
  6994 requests in 10.09s, 437.12KB read
Requests/sec:    693.49
Transfer/sec:     43.34KB
```

### wrk with DateTime

```
brg@AMacbook falcon-time-example % wrk -d 10 http://localhost:9292
Running 10s test @ http://localhost:9292
  2 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     1.22s    38.61ms   1.34s    71.74%
    Req/Sec     9.67     10.82    30.00     83.33%
  62 requests in 10.07s, 3.88KB read
  Socket errors: connect 0, read 0, write 0, timeout 16
Requests/sec:      6.15
Transfer/sec:     393.91B
```

## Simple rackup (with puma)

```
brg@AMacbook falcon-time-example % rackup                                                              

Puma starting in single mode...
* Puma version: 5.6.5 (ruby 3.1.2-p20) ("Birdie's Version")
*  Min threads: 0
*  Max threads: 5
*  Environment: development
*          PID: 56483
* Listening on http://127.0.0.1:9292
* Listening on http://[::1]:9292
```

### with Time

```
brg@AMacbook falcon-time-example % ab -n 100 -c 10 http://0.0.0.0:9292/

Concurrency Level:      10
Time taken for tests:   1.503 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      4100 bytes
HTML transferred:       300 bytes
Requests per second:    66.53 [#/sec] (mean)
Time per request:       150.302 [ms] (mean)
Time per request:       15.030 [ms] (mean, across all concurrent requests)
Transfer rate:          2.66 [Kbytes/sec] received
```

## with DateTime

```
brg@AMacbook falcon-time-example % ab -n 100 -c 10 http://0.0.0.0:9292/

Concurrency Level:      10
Time taken for tests:   0.664 seconds
Complete requests:      100
Failed requests:        0
Total transferred:      4100 bytes
HTML transferred:       300 bytes
Requests per second:    150.56 [#/sec] (mean)
Time per request:       66.418 [ms] (mean)
Time per request:       6.642 [ms] (mean, across all concurrent requests)
Transfer rate:          6.03 [Kbytes/sec] received
```
