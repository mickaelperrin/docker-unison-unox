## Usage

This image is the unison-image for [docker-sync](https://github.com/EugenMayer/docker-sync) and published on [eugenmayer/unison-unox](https://hub.docker.com/r/eugenmayer/unison-unox/)
Most of  the credits go to [mickaelperrin](https://github.com/mickaelperrin) - he done most of the work including the dualsync basics.

## What does it do ?

This image simply runs an unison server on the internal port `5000` with the specified user/uid. If the user/uid doesn't
exist, it is created/modified on startup.

## Documetation

You can configure how unison runs by using the following ENV variables:
 
 - `UNISON_DIR` specifies the directory created in the container to store the synced files, `/data` by default
 - `UNISON_OWNER` specifies **the user name** on which the unison process run and the owner of the synced files
 - `UNISON_OWNER_UID` specifies **the ID of the user** on which the unison process run and the owner of the synced files.
 - `MAX_INOTIFY_WATCHES` increases the limit of inotify watches if you need to sync folders with lots of files. 

## Credits
- Big thanks at [mickaelperrin](https://github.com/mickaelperrin) for putting hard work into getting this dualsync ready
- Thank to [onnimonni](https://github.com/onnimonni) wich was initially the base of this image

## License
What the others did, so:
This docker image is licensed under GPLv3 because Unison is licensed under GPLv3 and is included in the image. See LICENSE.
