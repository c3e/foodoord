#!/bin/sh
set -e

export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export GIT_SSH="/usr/sbin/gitlab-ssh-wrapper"

dest=/var/run/foodoor-keys

if [ ! -e "${dest}/.git/config" ]
then
#echo "Repo does not exist, trying to clone..."
( cd /var/run && git clone --quiet --single-branch --depth=1 luftschleuse@nordstern.chaospott.de:/home/luftschleuse/foodoor-keys "${dest}" )
else
#echo "Repo exists, updating..."
( cd "${dest}" && git fetch --quiet && git merge --quiet origin/master master )
fi

for action in open close
do
outfile="${dest}/authorized_keys.${action}"
rm -f ${outfile}
find "${dest}/keys" -name '*.pub' | sort | \
while read keyfile
do
printf "command=\"/usr/sbin/foodoor.sh ${action}\",no-port-forwarding,no-X11-forwarding,no-agent-forwarding " >> ${outfile}
cat "${keyfile}" >> ${outfile}
done
install -b -S .last -o ${action} -g nogroup -m 0600 ${outfile} /home/${action}/.ssh/authorized_keys
done
