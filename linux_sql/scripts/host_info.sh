#! /bin/sh

#Get cpu info
specs=$(lscpu)

#hardware
hostname=$(hostname -f)
vmstat=$(vmstat -s)
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
cpu_architecture=$(echo "$lscpu_out"  | egrep "^Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(echo "$lscpu_out"  | egrep "^Model name:" | awk '{print $3, $4, $5, $6, $7}' | xargs)
cpu_mhz=$(echo "$lscpu_out"  | egrep "^CPU MHz:" | awk '{print $3}' | xargs)
l2_cache=$(echo "$lscpu_out"  | egrep "^L2 cache:" | awk '{print $3}' | xargs) #in kB
total_mem=$(echo "$memory_out"  | egrep "^Mem:" | awk '{print $2}' | xargs) #in kB
timestamp=$(TZ=UTC date +"%Y-%m-%d %H:%M:%S") #current timestamp in `2019-11-26 14:40:19` format