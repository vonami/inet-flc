import
    "EtherHub",
    "OSPFRouter",
    "StandardHost";

module OSPF_Area3
    gates:
        in: in[];
        out: out[];
    submodules:
        RT9: OSPFRouter;
            gatesizes:
                ethIn[2],
                ethOut[2];
            display: "p=148,200;i=srouter";
        RT12: OSPFRouter;
            gatesizes:
                ethIn[3],
                ethOut[3];
            display: "p=148,360;i=srouter";
        N9: EtherHub;
            gatesizes:
                in[4],
                out[4];
            display: "p=148,284;i=switch2";
        N10: EtherHub;
            gatesizes:
                in[3],
                out[3];
            display: "p=148,452;i=switch2";
        N11: EtherHub;
            gatesizes:
                in[3],
                out[3];
            display: "p=144,112;i=switch2";
        H12: StandardHost;
            gatesizes:
                ethIn[1],
                ethOut[1];
            display: "p=92,52;i=comp2_s";
        H13: StandardHost;
            gatesizes:
                ethIn[1],
                ethOut[1];
            display: "p=196,52;i=comp2_s";
        H14: StandardHost;
            gatesizes:
                ethIn[1],
                ethOut[1];
            display: "p=60,284;i=comp2_s";
        H15: StandardHost;
            gatesizes:
                ethIn[1],
                ethOut[1];
            display: "p=60,360;i=comp2_s";
        H16: StandardHost;
            gatesizes:
                ethIn[1],
                ethOut[1];
            display: "p=92,492;i=comp2_s";
        H17: StandardHost;
            gatesizes:
                ethIn[1],
                ethOut[1];
            display: "p=196,492;i=comp2_s";
    connections:
        H12.ethOut[0] --> N11.in[0];
        N11.out[0] --> H12.ethIn[0];
        N11.out[1] --> RT9.ethIn[0];
        RT9.ethOut[0] --> N11.in[1];
        N11.out[2] --> H13.ethIn[0];
        H13.ethOut[0] --> N11.in[2];
        RT9.ethOut[1] --> N9.in[0];
        N9.out[0] --> RT9.ethIn[1];
        N9.out[1] --> H14.ethIn[0];
        H14.ethOut[0] --> N9.in[1];
        N9.out[2] --> RT12.ethIn[0];
        RT12.ethOut[0] --> N9.in[2];
        N9.out[3] --> out[0];
        in[0] --> N9.in[3];
        RT12.ethOut[1] --> H15.ethIn[0];
        H15.ethOut[0] --> RT12.ethIn[1];
        RT12.ethOut[2] --> N10.in[0];
        N10.out[0] --> RT12.ethIn[2];
        N10.out[1] --> H16.ethIn[0];
        H16.ethOut[0] --> N10.in[1];
        N10.out[2] --> H17.ethIn[0];
        H17.ethOut[0] --> N10.in[2];
    display: "p=10,10;b=264,528";
endmodule

