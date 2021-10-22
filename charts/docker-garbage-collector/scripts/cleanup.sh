#!/bin/sh
EXITED_CONTAINERS=$(docker ps -q -f status=exited)
DANGLING_VOLUMES=$(docker volume ls -qf dangling=true)
DANGLING_IMAGES=$(docker images --filter "dangling=true" -q --no-trunc)

if [ -n "${EXITED_CONTAINERS}" ]; then
  echo "Cleaning up exited containers..."
  docker rm "${EXITED_CONTAINERS}"
  echo "DONE!"
fi

if [ -n "${DANGLING_VOLUMES}" ]; then
  echo "Cleaning up dangling volumes..."
  docker volume rm "${DANGLING_VOLUMES}"
  echo "DONE!"
fi

if [ -n "${DANGLING_IMAGES}" ]; then
  echo "Cleaning up dangling images..."
  docker rmi "${DANGLING_IMAGES}"
  echo "DONE!"
fi

echo "Pruning the docker system..."
docker system prune -a -f --volumes ;
echo "DONE!"
echo "Cleanup is completed!"
sleep 10
exit "0" || return "0"
