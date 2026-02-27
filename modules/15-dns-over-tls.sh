sudo sed -i "s/^#\?DNS=.*/DNS=157.90.170.95#dns.nairi.cloud/" /etc/systemd/resolved.conf &&
  sudo sed -i "s/^#\?DNSOverTLS=.*/DNSOverTLS=yes/" /etc/systemd/resolved.conf &&
  sudo sed -i "s/^#\?DNSSEC=.*/DNSSEC=yes/" /etc/systemd/resolved.conf &&
  sudo sed -i "s/^#\?Domains=.*/Domains=~./" /etc/systemd/resolved.conf &&
  ensure_service_active systemd-resolved
