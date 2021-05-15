#### run with container

```bash
git clone https://github.com/jobscale/bastion.git
cd bastion

docker build . -t local/bastion
docker run --rm -d local/bastion
```
