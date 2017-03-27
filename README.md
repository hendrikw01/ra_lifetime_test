# ra_lifetime_test
Generates Router Advertisements to validate the correct behavior of `ValidLifetime` according to RFC4862 Sections 5.5.3.d and  5.5.3.e

### Run
> ./test.sh IFACE_NAME

### Watch results
> watch -n 1 -d ip -6 addr list IFACE_NAME


Compare with test output.
