# squid

## How to use

### Build
```
docker build -t grandcolline/squid .
```

### Run
```
docker run \
	-p 3128:3128 \
	-e "PROXY_USER=grandcolline" \
	-e "PROXY_PASS=password" \
	-v /var/log/squid:/var/log/squid:rw \
	-v /var/cache/squid:/var/cache/squid:rw \
	grandcolline/squid
```


