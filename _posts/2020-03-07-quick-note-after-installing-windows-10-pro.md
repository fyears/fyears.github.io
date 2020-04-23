---
published: true
layout: post
title: 'quick note after installing windows 10 pro'
tags:
  - technology
categories: technology
---

This is the quick note before and after installing Windows 10 pro.

- installing Windows:
  - download: <https://www.microsoft.com/software-download/Windows10>
  - remember to add this file `\sources\ei.cfg` so that we can select installing home or pro during installation:
    ```
    [Channel]
    Retail
    ```
- Windows features
  - search "Turn Windows features on of off"
  - enable Hyper-V and Windows Subsystem For Linux
- Chrome: 
  - [offline installer](https://www.google.com/intl/en/chrome/browser/desktop/index.html?standalone=1), from [help](https://support.google.com/chrome/answer/95346)
  - disable auto sign in
  - always ask where to save files
  - essential extentions: uBlock Origin, ...
- Firefox:
  - [offline installer](https://www.mozilla.org/en-US/firefox/all/)
  - always ask where to save files
  - essential extentions: ...
- VS Code: must have, download [user installer 64 bit](https://code.visualstudio.com/docs/?dv=win64user) from official web site
- mpv: must have, download and run `\installer\mpv-install.bat`
- Java:
  - download OpenJDK from [Amazon Corretto](https://aws.amazon.com/corretto/) (`.zip` for Windows) or [AdoptOpenJDK](https://adoptopenjdk.net/). As of 2020, OpenJDK 8 or 11 are most widely used.
  - see [here](https://stackoverflow.com/questions/52511778/) to set up `%JAVA_HOME%` as the path without `\bin` subfolder, and add `%JAVA_HOME%\bin` to `%PATH%`.
- pdf: [Sumatra PDF](https://www.sumatrapdfreader.org/)
- aria2c: remember to set `%USERPROFILE%\.aria2\aria2.conf`
- Python
  - install Anaconda
  - path: `\Anaconda3\script`, `\Anaconda3\Library\bin`, `\Anaconda3` (the second one is important)
- Git:
  - [disable gui password prompt](https://stackoverflow.com/questions/34396390) `git config --global core.askPass ""`
- Rime:
  - download: <https://rime.im/download/>
  - dict: <https://github.com/scomper/Rime>
  - dict: <https://github.com/Chernfalin/better-rime-dict>
  - customizing: `%APPDATA%\Rime`
