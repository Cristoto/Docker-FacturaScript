# Docker Facturascripts

This repository build a Docker image based on the project of [NeoRazorX/facturascripts](https://github.com/NeoRazorX/facturascripts).

## Requirements

You need a **mysql-server** running on your computer on an external service. You can use [official Docker mysql image](https://hub.docker.com/r/mysql/mysql-server/) .

## Description

This image use by default the latest version on  [NeoRazorX/facturascripts](https://github.com/NeoRazorX/facturascripts) to create the container. But, if you want to use another version, you must modify the value of the environment variable `FS_VERSION` .

## Quick start

```bash
docker run -d --name facturascripts -p 8080:80 cristoto/facturascripts
```

## Environment Variables

#### **`FS_VERSION`**

Indicate the complete url to download the zip of the specify release that you want use it.

The next example use the version 2018-04 to build the container.

```bash
docker run -d -e FS_VERSION=https://github.com/NeoRazorX/facturascripts/releases/download/2018.04/2018-04.zip --name facturascripts -p 8080:80 cristoto/facturascripts
```

## Volumes

`/app`

Default location to all files.