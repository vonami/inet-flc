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
#include "IntServ.h"
#include "RSVPPacket.h"
}}

struct RsvpHopObj_t;
struct SenderTemplateObj_t;
struct LabelRequestObj_t;
struct SenderDescriptor_t;

class noncobject IPAddress;
class noncobject EroVector;

class RSVPPacket;

//
// FIXME missing documentation
//
message RSVPPathMsg extends RSVPPacket
{
    properties:
        customize=true;
    fields:
        RsvpHopObj_t hop;
        LabelRequestObj_t label_request;
        SenderDescriptor_t sender_descriptor;
        EroVector ERO;
        int color;

        int rsvpKind = PATH_MESSAGE;
};

//
// FIXME missing documentation
//
message RSVPPathTear extends RSVPPacket
{
    properties:
        customize=true;
    fields:
        RsvpHopObj_t hop;
        SenderTemplateObj_t senderTemplate;
        bool force;
        int rsvpKind = PTEAR_MESSAGE;
};


//
// FIXME missing documentation
//
message RSVPPathError extends RSVPPacket
{
    properties:
        customize=true;
    fields:
        IPAddress errorNode;
        int errorCode;
        SenderDescriptor_t sender_descriptor;

        int rsvpKind = PERROR_MESSAGE;
};

