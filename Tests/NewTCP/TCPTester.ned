//
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


//
// In addition to providing tcpdump-like functionality, it can delete,
// delay or duplicate \TCP segments, and inject new segments. Such segment
// manipulation can be controlled via a script.
//
// Script format:
//
// <i><segment><operation><args>; <segment><operation><args>; ...</i>
//
// e.g.:
//
// <tt>A2 delete; B3 delete; A3 delay 0.2; A4 copy 1.0,1.2; ...</tt>
//
// Where:
// - <i><segment></i>: A10 means 10th segment arriving from A
// - <i><operation></i> can be <tt>delete</tt>, <tt>delay</tt> or <tt>copy</tt>:
//    - <tt>delete</tt>: removes (doesn't copy) segment
//    - <tt>delay</tt> <i><delay></i>: forwards segment after a delay
//    - <tt>copy</tt> <i><delay1>,<delay2>,<delay3>,...</i>:
//      forwards copies of the segment after the given delays
//      (<tt>copy 0.5</tt> is the same as <tt>delay 0.5</tt>)
//
simple TCPScriptableTester
    parameters:
      script: string;
    gates:
      in: in1, in2;
      out: out1, out2;
endsimple


//
// Complements TCPScriptableTester: instead of working from a script, it
// executes a "random script".
//
simple TCPRandomTester
    parameters:
      pdelete: numeric const, // probability of deleting a packet
      pdelay: numeric const,  // probability of delaying a packet
      pcopy: numeric const,   // probability of creating several copies of the packet
      numCopies: numeric,     // related to pcopy: number of copies
      delayValue: numeric;    // related to pdelay and pcopy: delay introduced
    gates:
      in: in1, in2;
      out: out1, out2;
endsimple


