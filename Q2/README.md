
# Q2 Scenario Troubleshooting

as mentioned in the task, I will verify DNS resolution, by using cat /etc/resolv.conf we get to know our nameserver which is 127.0.0.53
next step is to  try and reselove internal.example.com by using the configured DNS: by running the command we see that ** server can't find internal.example.com: NXDOMAIN.

it failed which means that the problem is in the internal DNS config, to resolve: we try and use Google dns server, we get the same error which means both methods failed leading to a web server issue

next step is to use the curl tool for ports 80 or 443, both failed which might indicate that a firewall is blocking access.
we check if the service is listening on the correct ports by running sudo netstat -tuln | grep ':80\|:443'
it gave no output which means that there is no active service that is listening on the ports, which indicates that it is a web server or service problem

If there is a running web server or service while internal.example.com is down these are the following steps i would take:- 

1- Diagnose Service Reachability
    Commands used:
ping <server-ip>
nc -zv <server-ip> 80
nc -zv <server-ip> 443
curl http://<server-ip>
- Direct connection to server ip address on ports 80 and 443 is successful
- ping and curl responses also successful

2- Verify service locally
    command used:
    curl http://localhost
- if i get a page back then its running fine on localhost



