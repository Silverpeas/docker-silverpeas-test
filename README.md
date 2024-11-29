# docker-silverpeas-test

A `Dockerfile` that produces a standalone Docker image of [Silverpeas 6](http://www.silverpeas.org) 
for testing purpose. In this image, H2 is embedded and used as the default database for Silverpeas. 
No dependencies on other containers are required for its running.

Ready-to-use docker images of Silverpeas for testing purpose are available in our 
[Docker Hub repository](https://hub.docker.com/r/silverpeas/silverpeas-test/).

## Image creation

To create an image of the latest version of Silverpeas 6:

	$ ./build.sh

this will build an image containing the latest version of Silverpeas and the latest version of 
Wildfly supported by Silverpeas, with the tag `silverpeas/silverpeas-test:latest`.

Otherwise, to create an image of a given version of Silverpeas 6, you have to specify as argument 
both the exact version of Silverpeas and the exact version of Wildfly used by this version:

	$ ./build.sh 6.2.3 20.0.1

This will build a Docker image for Silverpeas 6.2.3 and with Wildfly 20.0.1 with 
the tag `silverpeas/silverpeas-test:6.2.3`. The versions passed as argument have to match the 
available versions of both Silverpeas and Wildfly; indeed, Silverpeas and Wildfly will be downloaded
from their respective project Web site.

## Container running

To run a container `silverpeas-test` from an image, just do:

	$ docker run --name silverpeas-test -p 8080:8000 -d silverpeas/silverpeas-test

The image exposes the 8000 port at which Silverpeas listens, and this port of the container is
mapped to the 8080 port of the host. Silverpeas takes a given amount of time to complete its
starting (about 1mn); you can check it is correctly started by consulting the logs with docker.

When the container is spawn from the image, a configuration step is performed before starting 
Silverpeas. This will give the possibility to customize the configuration of Silverpeas.
For example, the locale in Silverpeas being by default in French, you can specify another locale, 
say English, by passing it to the container through the `locale` environment variable:

	$ docker run --name silverpeas-test -p 8080:8000 -d -e locale=en silverpeas/silverpeas-test

To customize more configuration parameters in Silverpeas, please refer section 
**Custom configuration** below.

Once Silverpeas running, you can access it through the following URL 
[http://localhost:8000/silverpeas](http://localhost:8000/silverpeas) with your preferred web 
browser. To sign in, please use the following login identifier `SilverAdmin` with the following 
password `SilverAdmin`. You will find then a Silverpeas collaborative platform with an initial 
content set.

### Keep data out of the container

By default, the data are stored into the container and then they can be lost once the container is
removed. 
To share the data with others containers or to keep them out of a container, you
can mount the volumes `/opt/silverpeas/data` and `/var/lib/postgresql/data` on the host.
You can also mount the volume `/opt/silverpeas/log` in order to glance at the logs.
For example:

	$ docker run --name silverpeas-test -p 8080:8000 -d \
	  -v silverpeas-log:/opt/silverpeas/log \
	  -v silverpeas-data:/opt/silverpeas/data \
	  -v silverpeas-postgresql:/var/lib/postgresql/data \
	  silverpeas/silverpeas-test

The logs, the Silverpeas data and the PostgreSQL database's data are here all mounted on the host 
under the respective labels `silverpeas-log`, `silverpeas-data` and `silverpeas-postgresql`. 
Refers the [Docker Documentation](https://docs.docker.com/engine/tutorials/dockervolumes/#locating-a-volume) 
to locate the labels of mounted volumes in a Docker installation. Be careful, because the volumes 
have a content that was produced at the image creation, they cannot be mounted in the host's
filesystem without losing the volumes' content (the mount point overlays the pre-existing content of
the volume).

### Custom configuration

In the case you wish to set some specific configuration parameters in the global Silverpeas 
configuration file `config.properties`, set them into a `custom_config.properties` configuration 
file on the host and then map it to a `/opt/silverpeas/configuration/custom_config.properties` file 
in the container.
For example, to set the SMTP properties to receive email notifications, you add them into a 
`custom_config.properties` file (for our example, in your home directory `/home/me`):

	SMTP_SERVER=smtp.googlemail.com
	SMTP_AUTHENTICATION=true
	SMTP_DEBUG=false
	SMTP_PORT=465
	SMTP_USER=myidentifier@gmail.com
	SMTP_PASSWORD=mypassword
	SMTP_SECURE=true

then you map it to the container:

	$ docker run --name silverpeas-test -p 8080:8000 -d \
	  -v /home/me/custom_config.properties:/opt/silverpeas/configuration/custom_config.properties \
	  silverpeas/silverpeas-test

The custom configuration file will be then parsed to add each parameters into the global Silverpeas
configuration file.

### Custom Silverpeas settings

The Silverpeas core engines as well as the Silverpeas applications can be customized by modifying 
their settings in their properties files located in the `/opt/silverpeas/properties` directory. For 
historical reason, the customization of such settings are performed by XML scripts  
that follows the syntax of the main `00-SilverpeasSettings.xml` script in the 
`/opt/silverpeas/configuration/silverpeas` directory.

By default, this image is provided with a customization of some settings through the XML file 
`CustomerSettings.xml`, in order to provide a ready-to-test Silverpeas platform. If you which to add
additional customization of the Silverpeas settings, you can do it by adding then into your own 
XML file and then map it to the same file in the
`/opt/silverpeas/configuration/silverpeas/` directory in the container.
For example, to set weaker rules for passwords, you can set them into the 
`MyOwnCustomSettings.xml`XML file (located for example in your home directory `/home/me`):
  
    <?xml version="1.0" encoding="UTF-8"?>
    <silverpeas-settings product="custom">
      <fileset root="${SILVERPEAS_HOME}/properties/org/silverpeas">
        <configfile name="password/settings/password.properties">
          <parameter key="password.rule.minLength">4</parameter>
          <parameter key="password.rule.blankForbidden">false</parameter>
          <parameter key="password.rule.sequentialForbidden">false</parameter>
          <parameter key="password.rule.atLeastXUppercase">false</parameter>
          <parameter key="password.rule.atLeastXLowercase">false</parameter>
          <parameter key="password.rule.atLeastXDigit">false</parameter>
          <parameter key="password.rule.atLeastXSpecialChar">false</parameter>
        </configfile>
      </fileset>
    </silverpeas-settings>

then you map it to the container:

	$ docker run --name silverpeas-test -p 8080:8000 -d \
	  -v /home/me/MyOwnCustomSettings.xml:/opt/silverpeas/configuration/silverpeas/MyOwnCustomSettings.xml \
	  silverpeas/silverpeas-test

## Logs

You can follow the activity of Silverpeas by watching the logs generated in the mounted 
`/opt/silverpeas/log` directory.

The output of Wildfly is redirected into the container standard output and as such it can be 
watched as following:

	$ docker logs -f silverpeas

## For development purpose

You can use this project to build a Silverpeas docker image with your own changes in the Silverpeas
code. For doing, build the code of Silverpeas (at least both `Silverpeas-Core` and 
`Silverpeas-Component`) with as Maven repository the `src/repository` directory. This folder will be
then automatically used when building a test image of Silverpeas.