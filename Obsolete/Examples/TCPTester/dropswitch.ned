//
// Copyright (C) 2000 Institut fuer Nachrichtentechnik, Universitaet Karlsruhe
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

//
// Modified switch
//
simple DropSwitch
    parameters:
       server_port,
        pk_delay,
        burst_delete_probability, // prob that a burst will be deleted
        error_burst_len,    // number of packets do be dropped in case of burst error
        delete_probability, // in percent !!!
        syn_client_del,
        syn_server_del,
        ack_client_del,
        ack_server_del,
        tcp_server_del,
        tcp_client_del,
        fin_client_del,
        fin_server_del;
    gates:
        in: in[];
        out: out[];
endsimple
