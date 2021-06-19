#!/usr/bin/perl
#
# Prototype script for EDNS option RRSERIAL towards a patched
# NSD server, using a patched Net::DNS version, for early
# implementation tests.
#
# Use:
#       test-rrserial.pl QNAME QTYPE
#
# $ ./test-rrserial.pl dateserial.example.com txt
# RCODE:    NOERROR
# RRSERIAL: 2018081401
# ANSWER:   incserial.example.com.	43200	IN	TXT	"Test zone for RRSERIAL record"
#
# Author: hugo@nic.cl
#
use strict;
use warnings;

use feature 'say';
use Net::DNS;

my $qname = shift;
my $qtype = shift;

my $resolver = Net::DNS::Resolver->new(
    nameservers => [ '200.1.122.30' ],
    recurse     => 0,
);

my $query = Net::DNS::Packet->new( $qname, $qtype, 'IN' );
$query->edns->option( 'RRSERIAL', '' );

my $reply = $resolver->send( $query );

my %data = $reply->edns->option('RRSERIAL');
say 'RCODE:    ', $reply->header->rcode;
say 'RRSERIAL: ', $data{'SOA-SERIAL'};
foreach my $ans ($reply->answer) {
    say 'ANSWER:   ', $ans->string;
}

