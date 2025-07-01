# Log

`top-user-agents-urls.sh` is a script that is useful for reviewing logs on a
web server.

It is still a work-in-progress (WIP), but it is functional enough that it helps
at this point. More complete projects include
[goaccess](https://github.com/allinurl/goaccess/) and
[apachetop](https://github.com/tessus/apachetop), but this is good too.

You put it on a server. Change the config file to match your log. Run the
script. Get a glimpse of what is happening. Potentially block individual
addresses with unwanted behavior.

This pairs well with the asn scripts. After taking action or recognizing known
behavior, you can add addresses to the TMPBLOCK line to dig deeper.

Note: This will not help with finding botnets and vulnerability scanners that
intentionally try to "fly under the radar" of log analysis. If user-agent
versions are intentionally randomized with random number generators, they will
not show up in the user-agent section.
