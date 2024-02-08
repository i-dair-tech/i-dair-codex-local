# I-DAIR CODEX Local Setup

## Overview

This project provides a sample Docker compose file and associated configuration files to run the
I-DAIR CODEX application locally without SSL, Authentication Server and Signoz tracing.

This has been tested on Ubuntu 18.04 using Docker 24.0.2. Please make sure you have docker installed before
trying to run the application.

## Known issues

1) The sample docker compose exposes services on several ports that might conflict with existing ports 
already occupied by other processes. If this is the case, please make sure to either stop any process 
that use conflicting ports or modify the ports in the docker-compose.yml as well as the nginx/conf.d/default.conf .
Also, shouldn't be using the host network mode for several containers.

2) On first startup there is a race condition related to the database creation and the application will not work. 
Therefore, for the first time you will need to start, then stop and then start again.

3) Since the sample docker compose doesn't provide the Signoz container you will see errors regarding tracing
in the logs. These can be safely ignored.

4) File permissions haven't been properly considered across the components and hence the runtime directories 
are using 777.


## Start the application

To start the application run the start.sh shell script
```
$ ./start.sh
```

This will execute "docker compose" in the background. 

To check the log files you can run the tail-logs.sh script

```
$ ./tail-logs.sh
```

## Access the application

Go to http://localhost

You can also directly log into
MLFlow: http://localhost:5000
PhpMyAdmin:  http://localhost:8088

## Stop the application

To stop you can run the stop.sh shell script

```
$ ./stop.sh
```

## Cleanup

For docker resources you can run docker compose down with the --volumes flags by passing 
"-c" or --"clean" to the stop command

```
$ ./stop.sh -c 
```

Additionally, you may want to remove the created directories like mlruns, dataset and logs yourself

```
$ rm -rf mlruns dataset logs
```

Finally, you can always revert to cleaning up containers, images and volumes using
the respective docker commands. Please refer to the online documention: 
https://docs.docker.com/reference/





