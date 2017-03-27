#!/bin/sh

testcase () { 
   	radvd -n -C $1_radvd.conf &
	pid=$!
	sleep 2
	kill -9 $pid &>/dev/null
	sleep 5
}

if [ $# -eq 1 ]
  then
    sed -i -- "s/interface .*$/interface $1/g" *_radvd.conf
fi

echo "Case1: Prefix 2001:db8:1:0::/64 shouldn't appear\n"
testcase 001

echo "Case2: Prefix2 2001:db8:2:0::/64 should appear with validLifetime = 100\n"
testcase 002

echo "Case3: Prefix2 2001:db8:2:0::/64 should update but validLifetime shouldn't\n"
testcase 003

echo "Case4: Prefix2 2001:db8:2:0::/64 should update with validLifetime = 99\n"
testcase 004

echo "Case5: Prefix2 2001:db8:2:0::/64 should update with validLifetime = 7200\n"
testcase 005

echo "Case5: Prefix2 2001:db8:2:0::/64 should update with validLifetime = 7300\n"
testcase 006

echo "Test ended.\n";









