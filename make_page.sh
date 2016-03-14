#!/bin/bash 

#make_page - A script to create HTML file

title="System Information:"
machine=$HOSTNAME
RIGHT_NOW=$(date +"%x %r %Z")
TIME_STAMP="Updated on $RIGHT_NOW by $USER"

function system_info
{
	echo "<h3>System release info:</h3>"
	echo "<pre>"
	uname -a
	echo "</pre>"
}

function show_uptime
{
	echo "<h3>System uptime:</h3> "
	echo "<pre>"
	uptime
	echo "</pre>"
}

function drive_space
{
	echo "<h3>Filesystem space:</h3> "
	echo "<pre>"
	df -h
	echo "</pre>"
}

function home_space
{
if [ "$(id -u)" = "0" ] ; then
	echo "<h3>Home directory space:</h3>"
	echo "<pre>"
	du -sh /home/* | sort -nr
	echo "</pre>"
else
	echo "$USER can't run this part"
fi
}

#### Main #####
#if [ "$(id -u)" != "0" ]; then
#echo "$USER can't run this script, sorry :("
#else
cat <<- _EOF_

	<HTML>
	<HEAD>
	  <TITLE>
	  $title $machine
	  </TITLE>
	</HEAD>

	<BODY>
	<H1>$title $machine</H1>
	<p>$TIME_STAMP.
	$(system_info)
	$(show_uptime)
	$(drive_space)
	$(home_space)
	</BODY>
	</HTML>
_EOF_
#fi
