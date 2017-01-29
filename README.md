# Storax Overlay

[![Build Status](https://travis-ci.org/storax/storax-overlay.png)](https://travis-ci.org/storax/storax-overlay)

Overlay for projects not officially supported that I personally would like to manage with
portage.

> **These ebuilds are "maintained" by myself. Feel free to provide feedback or contribute but please be aware that I only have limited time to dedicade towards this overlay.

This overlay is only tested on **amd64 (64bit)**.

## Installation

Prerequisite for managing overlays is [_layman_](http://layman.sourceforge.net).
Install **app-portage/layman** with:

```
emerge -av app-portage/layman
```

Download the overlay metadata into the _layman_ overlays directory:

```
wget -q -O /etc/layman/overlays/storax-overlay.xml https://raw.githubusercontent.com/storax/storax-overlay/master/overlay.xml
```

Fetch all available overlays and add **storax-overlay**:

```
layman -Lk
layman -a storax-overlay
```

## Updates

Sync updates with:

```
layman -s storax-overlay
```


## Uninstall

To remove this overlay remove it from the active overlays first and then remove the metadata file:

```
layman -d storax-overlay
rm -r /etc/layman/overlays/storax-overlay.xml
```
