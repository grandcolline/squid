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
	grandcolline/squid
```


