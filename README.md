# Run DNS container
podman run --cgroups=no-conmon --rm --sdnotify=conmon --replace -d -m 256M --name dns-subdomain-container --network host -v /data/named/:/var/named/zones --security-opt label=disable quay.io/redhat/dns
