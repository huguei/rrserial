# ZONEVERSION (was: RRSERIAL)

ZONEVERSION is a new DNS extension (EDNS option) for retrieving, along
with a DNS answer, a token with the zone version that corresponds with
the answer. There could be several meanings for "the version of a zone",
one of it being "the SOA serial number", which is the initial defined
as SOA-SERIAL.

This extension allows for new meanings of "the version of a zone"
besides SOA-SERIAL, which must be registered in a "flag registry"
and specified in separate future documents.

This page contains Documentation, scripts and software for developers.

_PLEASE NOTE_: all code is using a temporary EDNS code for ZONEVERSION (65024). Remember to change it to the official code from IANA once the RFC is published.

## Protocol changes

Official documentation, draft being worked on IETF DNSOP working group.

- HTML version 00 (last version on 2022-04-21):<br>
    https://www.ietf.org/archive/id/draft-ietf-dnsop-zoneversion-00.html

- Last version in IETF datatracker:<br>
    https://datatracker.ietf.org/doc/draft-ietf-dnsop-zoneversion/

For comments and questions please use the [DNSOP WG mailing list](https://mailarchive.ietf.org/arch/browse/dnsop/).


## Implementations

- Live authoritative DNS server with a patched NSD: **200.1.122.30**

  Zones: dateserial.example.com and incserial.example.com with MX, TXT and AAAA apex records.

- Unofficial NSD with RRSERIAL patches:<br> 
    https://github.com/huguei/nsd/tree/rrserial

- Unofficial dig command with +rrserial EDNS option:<br>
    https://gitlab.isc.org/huguei/bind9/-/tree/rrserial

- **Drink** includes native zoneversion support (experimental authoritative name server):<br>
    https://framagit.org/bortzmeyer/drink

- Python and Go test scripts:<br>
    https://www.bortzmeyer.org/files/test-rrserial.py<br>
    https://www.bortzmeyer.org/files/test-rrserial.go

  more information [in an article from @bortzmeyer](https://www.bortzmeyer.org/edns-option.html) (in French).

- Perl script test:<br>
    https://github.com/huguei/rrserial/blob/main/tests/test-rrserial.pl (with plain Net::DNS)<br>
    https://github.com/huguei/rrserial/blob/main/tests/test-rrserial-patched-dns-net.pl (over a patched Net::DNS)

- Unofficial perl Net::DNS git clone:<br>
    https://github.com/huguei/Net-DNS/tree/zoneversion

