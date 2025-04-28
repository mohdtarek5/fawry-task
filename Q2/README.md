
# Q2 Scenario Troubleshooting

as mentioned in the task, I will verify DNS resolution, by using cat /etc/resolv.conf we get to know our nameserver which is 127.0.0.53
next step is to  try and reselove internal.example.com by using the configured DNS: by running the command we see that ** server can't find internal.example.com: NXDOMAIN.

it failed which means that the problem is in the internal DNS config, to resolve: we try and use Google dns server, we get the same error which means both methods failed leading to a web server issue

