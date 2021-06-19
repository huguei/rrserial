# RRSERIAL

RRSERIAL is a new DNS extension (EDNS option) for retrieving, along with
a DNS answer, the SOA serial of the zone.

This page contains Documentation, scripts and software for developers.

_PLEASE NOTE_: all code is using a temporary EDNS code for RRSERIAL (65024). Remember to change it to the official code from IANA once the RFC is published.

## Protocol changes

Official documentation, draft being worked on IETF DNSOP working group.

- HTML version 00 (last version on 2021-06-19):<br>
    https://www.ietf.org/archive/id/draft-ietf-dnsop-rrserial-00.html

- Last version in IETF datatracker:<br>
    https://datatracker.ietf.org/doc/draft-ietf-dnsop-rrserial/

For comments and questions please use the [DNSOP WG mailing list](https://mailarchive.ietf.org/arch/browse/dnsop/).


## Implementations

- Live authoritative DNS server with a patched NSD: **200.1.122.30**

  Zones: dateserial.example.com and dateserial.example.com with MX, TXT and AAAA apex records.

- Unofficial NSD with RRSERIAL patches:<br> 
    https://github.com/huguei/nsd/tree/rrserial

- Unofficial dig command with +rrserial EDNS option:<br>
    https://gitlab.isc.org/huguei/bind9/-/tree/rrserial

- Python and Go test scripts:<br>
    https://www.bortzmeyer.org/files/test-rrserial.py<br>
    https://www.bortzmeyer.org/files/test-rrserial.go

  more information [in an article from @bortzmeyer](https://www.bortzmeyer.org/edns-option.html) (in French).

- Perl script test:<br>
    https://github.com/huguei/rrserial/tests/test-rrserial.pl (with plain Net::DNS)<br>
    https://github.com/huguei/rrserial/tests/test-rrserial-patched-dns-net.pl (over a patched Net::DNS)

- Unofficial perl Net::DNS patch:<br>
    https://github.com/huguei/rrserial/perl-Net-DNS/net-dns.patch

