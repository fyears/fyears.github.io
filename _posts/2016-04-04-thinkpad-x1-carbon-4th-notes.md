---
published: true
layout: post
title: notes about Thinkpad X1 Carbon 4th gen (2016)
tags:
  - technology
categories: technology
---

## what

I just bought [Thinkpad X1 Carbon 4th gen (2016) (20FB)](http://shop.lenovo.com/us/en/laptops/thinkpad/x-series/x1-carbon-4/
). So far so good. I am feeling great satisfaction.

## Some notes

Disable secure boot and enable virtualization.

If want to cleanly install Windows 10, go to [official TechBench](https://www.microsoft.com/en-us/software-download/techbench) to download latest Windows 10 iso file.

We should use [`diskpart`](https://msdn.microsoft.com/en-us/library/windows/hardware/dn898510(v=vs.85).aspx) to format the disk if necessary:

```cmd
select disk 0
clean
convert gpt
create partition efi size=400
format quick fs=fat32 label="EFI"
create partition msr size=128
create partition primary size=71680
format quick fs=ntfs label="Windows"
assign letter="C"
create partition primary
format quick fs=ntfs label="other"
exit
```

After clean installation, the most important thing is using other computer to download [the driver for Intel Wireless AC 8260](https://downloadcenter.intel.com/product/86068/Intel-Dual-Band-Wireless-AC-8260) (as well as its Bluetooth driver) for Internet accessing.

Then, Windows should be able to automatically download the remaining drivers once connected to Internet.

But we could also download some missing drivers from [Lenovo official website](http://support.lenovo.com/us/en/products/laptops-and-netbooks/thinkpad-x-series-laptops/thinkpad-x1-carbon-type-20fb-20fc/?beta=false). For example, Hotkey Features Integration for Windows 10.

