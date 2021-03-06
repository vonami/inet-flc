//
// Copyright (C) 2006 Andras Varga
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//


import
    "NotificationBoard",
    "NAMTraceWriter",
    "InterfaceTable",
    "RoutingTable",
    "TCPApp.ned",
    "TCP.ned",
    "UDP",
    "UDPApp",
    "NetworkLayer",
    "PingApp",
    "PPPInterface",
    "EthernetInterface";



//
// \IP host with TCPSpoof in the application layer.
//
module TCPSpoofingHost
    parameters:
        numTcpApps: numeric const,
        numUdpApps: numeric const,
        tcpAppType: string,
        udpAppType: string,
        IPForward: bool,
        namid: numeric const,
        routingFile: string;
    gates:
        in: in[];
        out: out[];
        in: ethIn[];
        out: ethOut[];
    submodules:
        namTrace: NAMTraceWriter;
            parameters:
                namid = namid;
            display: "p=71,294;i=block/sink";
        notificationBoard: NotificationBoard;
            display: "p=71,54;i=block/control";
        interfaceTable: InterfaceTable;
            display: "p=71,134;i=block/table";
        routingTable: RoutingTable;
            parameters:
                IPForward = IPForward,
                routerId = "",
                routingFile = routingFile;
            display: "p=71,214;i=block/table";
        tcpSpoof: TCPSpoof;
            display: "p=168,122;i=block/square";
        networkLayer: NetworkLayer;
            parameters:
                proxyARP = false;
            gatesizes:
                ifIn[sizeof(out)+sizeof(ethOut)],
                ifOut[sizeof(out)+sizeof(ethOut)];
            display: "p=248,247;i=block/fork;q=queue";
        ppp: PPPInterface[sizeof(out)];
            display: "p=205,350,row,90;q=txQueue;i=block/ifcard";
        eth: EthernetInterface[sizeof(ethOut)];
            display: "p=240,350,row,90;q=txQueue;i=block/ifcard";
    connections nocheck:
        tcpSpoof.ipv4Out --> networkLayer.TCPIn;

        // connections to network outside
        for i=0..sizeof(out)-1 do
            in[i] --> ppp[i].physIn;
            out[i] <-- ppp[i].physOut;
            ppp[i].netwOut --> networkLayer.ifIn[i];
            ppp[i].netwIn <-- networkLayer.ifOut[i];
        endfor;

        for i=0..sizeof(ethOut)-1 do
            ethIn[i] --> eth[i].physIn;
            ethOut[i] <-- eth[i].physOut;
            eth[i].netwOut --> networkLayer.ifIn[sizeof(out)+i];
            eth[i].netwIn <-- networkLayer.ifOut[sizeof(out)+i];
        endfor;
endmodule

