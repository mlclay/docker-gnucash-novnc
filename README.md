# docker-gnucash-novnc
## Idea

create a gnucash docker image with novnc.
also some first playground with docker and github

## How to
### Run
Start the container via
```bash
docker run -td \
	-v </your/local/volume>:/var/gnucash \
	-p 6080:6080 \
	-e LOCALE=<your_LOCALE> \
	-e FILE=<your_gnucash_file> \
	bertlorenz/gnucash-novnc:<tag>
```
Then access via http://localhost:6080

### Locales
The following locales are preinstalled
* de_DE
* en_US
* en_GB

If using any other locale (such as fr_FR), it will be generated on startup which could increase the startup time.

## Credits

Got help from the following Repos / links

### Docker

https://github.com/paimpozhil/docker-novnc

https://github.com/Kaixhin/dockerfiles/tree/master/vnc

https://github.com/potz/docker-gnucash

### Gnucash

https://wiki.gnucash.org/wiki/Locale_Settings

https://wiki.gnucash.org/wiki/Building#Ubuntu_14.04_LTS_.28Trusty_Tahr.29