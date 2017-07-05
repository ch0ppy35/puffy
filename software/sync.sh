set -x
set -e
until ping -c1 192.168.1.1 &>/dev/null; do sleep 1; done
sleep 5
sshpass -p "vocore" scp -rp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null sync/* root@192.168.1.1:/overlay/upper
sleep 3
sshpass -p "vocore" ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@192.168.1.1 "reboot"

