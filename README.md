# DO280-scenarios
/run/dns-subdomain-container.service.ctr-id
7279bde788aa922e70d350e1118ae276c2134dbf7626a370eaa31d49fe55d9f7
"/usr/bin/podman",
                    "run",
                    "--cidfile=/run/dns-subdomain-container.service.ctr-id",
                    "--cgroups=no-conmon",
                    "--rm",
                    "--sdnotify=conmon",
                    "--replace",
                    "-d",
                    "-m",
                    "256M",
                    "--name",
                    "dns-subdomain-container",
                    "--network",
                    "host",
                    "-v",
                    "/data/named/:/var/named/zones",
                    "--security-opt",
                    "label=disable",
                    "dns-subdomain:latest"

