//
// Copyright (C) 2000 Institut fuer Telematik, Universitaet Karlsruhe
// Copyright (C) 2004 Andras Varga
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
// Fragments \IP datagrams if size is greater than MTU of output port.
// - receive valid \IP datagram from IPRouting or IPMulticast
// - Fragment datagram if size > MTU [output port]
// - send fragments to IPOutput
//
// author: Jochen Reber, Andras Varga
//
simple IPFragmentation
    gates:
        in: routingIn, multicastIn;
        out: outputOut;
endsimple

