//
// (C) 2005 Vojtech Janota
// (C) 2003 Xuan Thang Nguyen
//
// This library is free software, you can redistribute it
// and/or modify
// it under  the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation;
// either version 2 of the License, or any later version.
// The library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU Lesser General Public License for more details.
//


cplusplus {{
#include "RSVPPacket.h"
}}

class RSVPMessage;

//
// FIXME missing documentation
//
message RSVPHelloMsg extends RSVPMessage
{
    properties:
        customize=true;
    fields:
        bool request;
        bool ack;

        int srcInstance;
        int dstInstance;

        int rsvpKind = HELLO_MESSAGE;
};
