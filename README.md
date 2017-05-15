# docker-postfix-forward

## Usage

```
  sudo docker run -d --name postfix-forward -p 25 \
    -e FORWARDED_DOMAINS=example.com \
    -e FORWARD_TO=foo@bar.com \
    cizar/docker-postfix-forward
```

## Build

```
  sudo docker build -t docker-postfix-forward .
```
