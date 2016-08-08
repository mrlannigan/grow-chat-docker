#!/bin/bash -x

docker-compose -f /vagrant/docker-compose.yml build
docker-compose -f /vagrant/docker-compose.yml up -d

sleep 30
docker-compose -f /vagrant/docker-compose.yml ps
docker-compose -f /vagrant/docker-compose.yml exec -T elasticsearch /bin/bash -c "curl -s -S -XPOST \"http://localhost:9200/messages/\"; curl -s -S -XPUT \"http://localhost:9200/messages/Global/04572c98-92b6-4abe-bf7a-a4d9fbcb0d4e/_create\" -H \"Content-type:application/json\" -d '{\"picture\":\"https://lh6.googleusercontent.com/-KcqUw6_q3pQ/AAAAAAAAAAI/AAAAAAAAALI/a-OmMocpe-E/s96-c/photo.jpg\",\"name\":\"Julian Lannigan\",\"timestamp\":\"2016-08-06T18:54:21.277057\",\"message_id\":\"04572c98-92b6-4abe-bf7a-a4d9fbcb0d4e\",\"html\":\"Welcome to the Grow Developer Test&excl;<br>A few things to note:<ul><li>Room names are case sensitive.</li><li>Commands are case sensitive.</li></ul>\",\"message\":\"\",\"email\":\"julian.lannigan@gmail.com\",\"room\":\"Global\"}'; echo"

set +x

echo "======================="
echo "ACCESS"
echo "======================="
echo "hostfile: 192.168.13.37 => grow.dev"
echo "== or =="
echo "forwarded host port: http://localhost:8090"
echo "======================="
