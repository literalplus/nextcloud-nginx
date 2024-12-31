# Nextcloud NGINX Configuration for Kubernetes

**Imprortant for multiarch builds:** You need to install qemu-user-static qemu-user-static-binfmt in addition to podman.

## Backup

### Database

You can use the provided DB dump `CronJob` template:

```
oc process -f https://raw.githubusercontent.com/tobru/nextcloud-openshift/master/mariadb-backup.yaml | oc -n MYNAMESPACE create -f -
```

This script dumps the DB to the same PV as the database stores it's data.
You must make sure that you copy these files away to a real backup location.

### Files

To backup files, a simple solution would be to run f.e. [restic](http://restic.readthedocs.io/) in a Pod
as a `CronJob` and mount the PVCs as volumes. Then use an S3 endpoint for restic
to backup data to.
