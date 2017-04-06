---
published: true
layout: post
title: enable "Open PowerShell window here" in right click context menu
tags:
  - technology
categories: technology
---

In Windows 10 Anniversary Update and later Creators Update, if we press "shift" key **and** right click on desktop, drive, folder, folder blackground, we could see the menu "Open PowerShell window here". It's convenient for development. But how to reveal the menu?

After searching on the Internet for a while, I found the clear solution [on TenForums](https://www.tenforums.com/tutorials/60175-open-powershell-window-here-context-menu-add-windows-10-a.html) and decided to note it down here.

In short:

1. "Win + R", run `regedit` to open Registry Editor.
2. Go to the locations respectively:
    ```reg
    HKEY_CLASSES_ROOT\Directory\shell\Powershell
    HKEY_CLASSES_ROOT\Directory\Background\shell\Powershell
    HKEY_CLASSES_ROOT\Drive\shell\Powershell
    ```
    **For each key,** right click the key on the **left** panel, "Permissions...", "Advanced", change the owner to "Admistrators", then assign "Full Control" - "Allow" to "Admistrators". Press "OK".
3. **For each key,** **delete** the "Extended" key on the **right** panel.

After doing these, right click without pressing "Shift" on desktop or blank space in folder in Explorer, we should see the desired "Open PowerShell window here".

Some other useful links:

- [tutorial on TenForums](https://www.tenforums.com/tutorials/60175-open-powershell-window-here-context-menu-add-windows-10-a.html)
- [How to start PowerShell from Windows Explorer?](http://stackoverflow.com/questions/183901/how-to-start-powershell-from-windows-explorer)
- [Introducing PowerShell Prompt Here](http://www.hanselman.com/blog/IntroducingPowerShellPromptHere.aspx)
