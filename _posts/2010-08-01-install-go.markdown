---
date: '2010-08-01 10:56:18'
layout: post
slug: install-go
status: publish
title: Install Go programming language
wordpress_id: '17'
tags:
- go language
- google
- install
- programming
---

The “Go” programming language is a new programming language coming from Google .  Its is primarily aimed towards system development .

The webside is [golang.org](http://golang.org) .

We can download the web pages using the command:

[sourcecode language="bash"]

wget -r -p -np -k http://golang.org

[/sourcecode]

[![](http://wowsmallroad.files.wordpress.com/2010/01/gogopher2.png)](http://wowsmallroad.files.wordpress.com/2010/01/gogopher.png)

I installed it on my ubuntu 10.04 , i386 .

And any users in my computer should be able to run the program .

command:

[sourcecode language="bash"]
sudo apt-get install python-setuptools python-dev mercurial bison gcc libc6-dev ed make gawk
sudo chmod -R 777 /opt
mkdir /opt/go
sudo vim /etc/profile
[/sourcecode]

add these at the last :

[sourcecode language="text"]
export GOROOT=/opt/go
export GOOS=linux
export GOARCH=386
export PATH=/opt/go/bin:$PATH
[/sourcecode]

command:

[sourcecode language="bash"]
:wq
source /etc/profile
hg clone -r release https://go.googlecode.com/hg $GOROOT
cd $GOROOT/src
./all.bash
sudo chmod 755 /opt
[/sourcecode]

These should be seen if ./all.bash goes well:

[sourcecode language="text"]
--- cd ../test
N known bugs; 0 unexpected bugs
[/sourcecode]

Create a hello.go:

[sourcecode language="text"]
cd ~
cat >hello.go <<EOF
package main
import "fmt"
func main() {
	fmt.Printf("Hello, world; or Καλημέρα κόσμε; or こんにちは 世界n")
}
EOF
[/sourcecode]

and compile the file:

[sourcecode language="bash"]
8g hello.go  # compile; object goes into hello.8
8l hello.6   # link; output goes into 8.out
./8.out
Hello, world; or Καλημέρα κόσμε; or こんにちは 世界
[/sourcecode]

and update the releases the next time:

[sourcecode language="bash"]
sudo chmod 777 /opt
cd $GOROOT/src
hg pull
hg update release
./all.bash
sudo chmod 755 /opt
[/sourcecode]

[Here](http://pshahmumbai.wordpress.com/2009/11/14/installing-go-programming-language-on-ubuntu-linux/) is another turorial.
