#!/usr/bin/python
# pmkid-strip
# written by Dimitri Fousekis @rurapenthe0
# Copyright (C) 2019 Bitcrack Cyber Security PTY Ltd
#############################################################

# Load required components
import time
from scapy.all import *
from datetime import datetime,timedelta
import packetEssentials as packethandler
import sys
from scapy.layers.eap import EAPOL
from argparse import ArgumentParser
import time


############################################################
# Fixed vars if any
pmkidlist = []
ESSIDLookupDict = {}
PMKIDLookupDict = {}


def MakePMKID(pmk,pkt):
    theHash = pmk + '*'+pkt[Dot11].addr2.replace(':','')+'*'+pkt[Dot11].addr1.replace(':','')+'*'+ESSIDLookupDict[pkt[Dot11].addr2].encode('hex')
    return theHash

def GetPMKID(pkt):
    the_PMKID = packethandler.pt.byteRip(pkt[Raw].load, order='last', qty = 16, compress = True)
    if (the_PMKID[-1] != 0) and (the_PMKID != '00000000000000000000000000000000') and (the_PMKID not in pmkidlist):
        PMKIDLookupDict.update({ESSIDLookupDict[pkt[Dot11].addr2]:MakePMKID(the_PMKID,pkt)})
        pmkidlist.append(the_PMKID)

def HandlePackets(pkt):
    
    if pkt.haslayer(Dot11Beacon):
        if pkt.haslayer(Dot11Elt):
             ESSIDLookupDict.update({pkt[Dot11].addr2: pkt[Dot11Elt].info})
   
    if pkt.haslayer(EAPOL):
        #print "[+] Got EAPOL..."
         if (packethandler.pt.byteRip(pkt[Raw], qty = 3)[6:] == '89') or (packethandler.pt.byteRip(pkt[Raw], qty = 3)[6:] == '8a'):
                GetPMKID(pkt)





###initial run

try:
    if not sys.argv[1]:
        print "[-] No cap file specified. Give me a capture file to look for a PMKID." 
        sys.exit()
except:
        print "[-] No cap file specified. Give me a capture file to look for a PMKID."
    	sys.exit()

try:
    packets = rdpcap(sys.argv[1])
except:
        print "[-] This is not a valid CAP File. Try another one."
    	timestr = time.strftime("%Y%m%d-%H%M%S")
	sys.exit()


for packet in packets:
    HandlePackets(packet)

if PMKIDLookupDict:
    timestr = time.strftime("%Y%m%d-%H%M%S")
    print"[+] Found PMKIDs!"
    
    
    for keys in PMKIDLookupDict.keys():
        print "-> ESSID: "+keys+" | PMKID: "+PMKIDLookupDict[keys]

else:
    timestr = time.strftime("%Y%m%d-%H%M%S")
    print "[-] Sorry, No PMKIDs found in supplied capture file."






