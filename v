#!/bin/bash

command="";

postfix="${@:2:${#1}}";

case $1 in
  start)
     command="docker-compose up -d"
     ;;
  run)
     command="docker-compose run automation -e SHORTLIVED=1"
     ;;
  stop)
     command="docker-compose down"
     ;;
  cli)
     command="docker exec -it regression-framework_automation_1 bash -c \"cd /automation; exec \${SHELL:-sh}\""
     ;;
  *)
     echo $"Usage: $@ {start|run|stop|cli}"
esac

eval $command;
