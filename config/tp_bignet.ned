package inet.examples.ethernet.lans;

import inet.node.ethernet.EthernetHub;
import inet.node.ethernet.EthernetHost;

network BigHubLAN
{
    submodules:
        hostA: EthernetHost {
            parameters:
                eth.duplexMode = false;
                @display("p=250,80");
        }
        hostB: EthernetHost {
            parameters:
                eth.duplexMode = false;
                @display("p=420,140");
        }
        hostC: EthernetHost {
            parameters:
                eth.duplexMode = false;
                @display("p=420,280");
        }
        hostD: EthernetHost {
            parameters:
                eth.duplexMode = false;
                @display("p=250,340");
        }
        hostE: EthernetHost {
            parameters:
                eth.duplexMode = false;
                @display("p=80,280");
        }
        hostF: EthernetHost {
            parameters:
                eth.duplexMode = false;
                @display("p=80,140");
        }
        hub: EthernetHub {
            parameters:
                @display("p=250,210");
            gates:
                ethg[6];
        }
    connections:
        hub.ethg[0] <--> { delay = 0.1us; datarate = 100Mbps; } <--> hostA.ethg;
        hub.ethg[1] <--> { delay = 0.3us; datarate = 100Mbps; } <--> hostB.ethg;
        hub.ethg[2] <--> { delay = 0.4us; datarate = 100Mbps; } <--> hostC.ethg;
        hub.ethg[3] <--> { delay = 0.2us; datarate = 100Mbps; } <--> hostD.ethg;
        hub.ethg[4] <--> { delay = 0.3us; datarate = 100Mbps; } <--> hostE.ethg;
        hub.ethg[5] <--> { delay = 0.2us; datarate = 100Mbps; } <--> hostF.ethg;
}
