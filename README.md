docker build --secret id=ssh,src=Users/vexim/.ssh/id_rsa --progress=plain -t lab6 .

Dockerfile:12
--------------------
  10 |
  11 |
  12 | >>> RUN git clone git@github.com:vexim/pawcho5.git
  13 |
  14 |     FROM scratch as base
--------------------
ERROR: failed to solve: process "/bin/sh -c git clone git@github.com:vexim/pawcho5.git" did not complete successfully: exit code: 128

Host key verification failed - nie działa autoryzacja. 
