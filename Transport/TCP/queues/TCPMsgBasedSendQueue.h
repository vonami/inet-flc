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

#ifndef __TCPMESSAGESENDQUEUE_H
#define __TCPMESSAGESENDQUEUE_H

#include <list>
#include "TCPSendQueue.h"

/**
 * Send queue that manages messages.
 *
 * @see TCPMsgBasedRcvQueue
 */
class INET_API TCPMsgBasedSendQueue : public TCPSendQueue
{
  protected:
    struct Payload
    {
        unsigned int endSequenceNo;
        cMessage *msg;
    };
    typedef std::list<Payload> PayloadQueue;
    PayloadQueue payloadQueue;

    uint32 begin;  // 1st sequence number stored
    uint32 end;    // last sequence number stored +1

  public:
    /**
     * Ctor
     */
    TCPMsgBasedSendQueue();

    /**
     * Virtual dtor.
     */
    virtual ~TCPMsgBasedSendQueue();

    /**
     *
     */
    virtual void init(uint32 startSeq);

    /**
     * Returns a string with the region stored.
     */
    virtual std::string info() const;

    /**
     *
     */
    virtual void enqueueAppData(cMessage *msg);

    /**
     *
     */
    virtual uint32 bufferEndSeq();

    /**
     *
     */
    virtual TCPSegment *createSegmentWithBytes(uint32 fromSeq, ulong numBytes);

    /**
     *
     */
    virtual void discardUpTo(uint32 seqNum);
};

#endif


