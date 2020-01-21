---
published: true
layout: post
title: 'open HEIF and HEVC files in Windows'
tags:
  - technology
categories: technology
---

A few days ago, I wanted to transfer photos from my iPhone to my computer. But it was very annoying that after copying for a while, the process stopped with some errors occured.

After some searching, I found the reason: iPhone automatically transfer photos to JPEG format but the process was not stable. Here is the fix: `Settings App -> Photos -> TRANSFER TO MAC OR PC -> choose "Keep Originals" instead of "Automatic"`.

Then another issue was introduced: iOS used the format HEIF for images (with `.HEIC` file extention) and HEVC for videos that Windows system did not support initially.

Luckyly, Microsoft provided the official extntions:

* [HEIF Image Extensions](https://www.microsoft.com/en-us/p/heif-image-extensions/9pmmsr1cgpwg)
* [HEVC Video Extensions from Device Manufacturer](https://www.microsoft.com/en-us/p/hevc-video-extensions-from-device-manufacturer/9n4wgh0z6vhq) (for free) or [HEVC Video Extensions](https://www.microsoft.com/en-us/p/hevc-video-extensions/9nmzlz57r3t7) (for $0.99). The first one was not searchable directly from Microsoft Store, and the latter one was searchable but not for free. Some third-party discussions are [here](https://lifehacker.com/how-to-view-hevc-or-heic-files-in-windows-10-for-free-1827094768) and [there](https://www.windowscentral.com/microsoft-now-charging-hevc-video-extensions).

After installing these extentions, I was able to happily view (and preview in File Explorer) my iPhone photos on Windows 10.
