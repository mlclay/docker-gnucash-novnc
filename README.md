# gnucash
## Idea

create a gnucash docker image with novnc.
also some first playground with docker and github

## How to
Start the container via
```bash
docker run -td -v /your/local/volume:/var/gnucash -p 6080:6080 bertlorenz/gnucash-novnc
```
Then access via http://localhost:6080

## Credits

Got help from the following Repos / links

https://github.com/paimpozhil/docker-novnc

https://github.com/Kaixhin/dockerfiles/tree/master/vnc

https://wiki.gnucash.org/wiki/Building#Ubuntu_14.04_LTS_.28Trusty_Tahr.29

https://github.com/potz/docker-gnucash
