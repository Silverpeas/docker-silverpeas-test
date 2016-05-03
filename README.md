# docker-silverpeas-test

A Dockerfile that produces a standalone Docker image of [Silverpeas 6][silverpeas] for testing purpose.
In this image, H2 is embedded and used as the default database for Silverpeas. No dependencies on other containers are required for its running.

Ready-to-use docker images of Silverpeas for testing purpose are available in our [Docker Hub repository][dockerhub]

[silverpeas]: http://www.silverpeas.org
[dockerhub]: https://hub.docker.com/r/silverpeas/silverpeas-test/

## Image creation

To create an image of the latest version of Silverpeas 6:
```
$ ./build.sh
```
this will build an image containing the latest SNAPSHOT version of Silverpeas and the latest version of Wildfly supported by Silverpeas, with the tag `silverpeas/silverpeas-test:latest`.

Otherwise, to create an image of a given version of Silverpeas 6, you have to specify as argument both the exact version of Silverpeas and of Wildfly used by this version:
```
$ ./build.sh 6.0 10.0.0
```
This will build an image containing Silverpeas 6.0 (not yet available) and Wildfly 10.0.0 with the tag `silverpeas/silverpeas-test-6.0`. The versions passed as argument have to match the versions of Silverpeas and Wildfly available in the Web; indeed, Silverpeas and Wildfly will be downloaded from their respective project Web site.

## Container running

To run a container `silverpeas-test` from an image, just do:
```
$ docker run --name silverpeas-test -p 8080:8000 -d silverpeas/silverpeas-test
```
The image exposes the 8000 port at which Silverpeas listens, and this port of the container is mapped to the 8080 port of the host.

When the container is spawn from the image, a configuration step is performed before starting Silverpeas. 
If you have no custom configurations to apply before running Silverpeas, you can avoid this step by starting directly Silverpeas:
```
$ docker run --name silverpeas-test -p 8080:8000 -d silverpeas/silverpeas-test start
```

By default, the locale in Silverpeas is in French. To have instead the locale in English:
```
$ docker run --name silverpeas-test -p 8080:8000 -d -e locale=en silverpeas/silverpeas-test
```
this will configure Silverpeas by settings its default locale to English.

### Keep data out of the container

By default, the data are stored into the container and then they can be lost once the container removed. 
To share the data with others containers running Silverpeas or to keep them out of a container, you can mount the volumes `/opt/silverpeas/data` and `/opt/silverpeas/h2` on the host.
You can also mount the volume `/opt/silverpeas/log` in order to glance at the logs.
For example:
```
$ docker run --name silverpeas-test -p 8080:8000 -d \
  -v /home/me/silverpeas/log:/opt/silverpeas/log \
  -v /home/me/silverpeas/data:/opt/silverpeas/data \
  -v /home/me/silverpeas/h2:/opt/silverpeas/h2 \
  silverpeas/silverpeas-test
```

### Custom configuration

In the case you wish to set some specific configuration parameters in the global Silverpeas configuration file `config.properties`, set them into a `custom_config.properties` configuration file on the host and then mount it as `/opt/silverpeas/configuration/custom_config.properties` in the container.
For example, to set the SMTP properties to receive email notifications, in a `custom_config.properties` file:
```
SILVERPEAS_USER_LANGUAGE=en
SILVERPEAS_CONTENT_LANGUAGES=en fr

SMTP_SERVER=smtp.googlemail.com
SMTP_AUTHENTICATION=true
SMTP_DEBUG=false
SMTP_PORT=465
SMTP_USER=myidentifier@gmail.com
SMTP_PASSWORD=mypassword
SMTP_SECURE=true
```
mount it to the container:
```
$ docker run --name silverpeas-test -p 8080:8000 -d \
  -v /home/me/silverpeas/custom_config.properties:/opt/silverpeas/configuration/custom_config.properties \
  silverpeas/silverpeas-test
```
(Warning: don't shift the configuration step if you want the `custom_config.properties` to be taken into account.)

## Logs

You can follow the activity of Silverpeas by watching the logs generated in the mounted `/opt/silverpeas/log` directory.

The output of Wildfly is redirected into the container standard output and as such it can be watched as following:
```
$ docker logs -f silverpeas
```

