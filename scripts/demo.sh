cd "$HOME/omnetpp-ws/omnetpp-6.1" && . ./setenv -f >/dev/null
cd "$HOME/omnetpp-ws/inet4.5" && . ./setenv -f >/dev/null

OMNET="$HOME/omnetpp-ws/omnetpp-6.1"
INET="$HOME/omnetpp-ws/inet4.5"
S5G="$HOME/omnetpp-ws/Simu5G-1.3.0"

run_aloha() {
    ( cd "$OMNET/samples/aloha" && ./aloha -u Qtenv -c "$1" )
}

run_eth() {
    ( cd "$INET/examples/ethernet/lans" && \
      opp_run -u Qtenv -c "$1" -l "$INET/src/INET" \
              -n "$INET/src:$INET/examples" tp_lan.ini )
}

run_5g() {
    ( cd "$S5G/simulations/NR/standalone" && \
      opp_run -u Qtenv -c "$1" -l "$S5G/src/simu5g" -l "$INET/src/INET" \
              -n "$S5G/src:$S5G/simulations:$INET/src:$INET/examples" tp_ran.ini )
}

while true; do
    clear
    echo "==========================================================="
    echo "        5G / OMNeT++ / Simu5G  -  Simulation Demo"
    echo "==========================================================="
    echo
    echo "  TASK 1  -  ALOHA (OMNeT++)"
    echo "     1) Overloaded load  (many collisions)"
    echo "     2) Optimal load     (near maximum throughput)"
    echo
    echo "  TASK 2  -  Ethernet LAN (INET)"
    echo "     3) Hub      -  4 hosts, shared medium (collisions)"
    echo "     4) Switch   -  4 hosts, switched      (zero collisions)"
    echo "     5) Big hub  -  6 hosts, custom topology"
    echo
    echo "  TASK 3  -  5G Radio Access Network (Simu5G)"
    echo "     6) 1 gNB + 5 UEs, downlink user-plane traffic"
    echo
    echo "     0) Quit"
    echo
    echo "-----------------------------------------------------------"
    printf "  Your choice: "
    read choice
    case "$choice" in
        1) run_aloha PureAloha1 ;;
        2) run_aloha PureAloha2 ;;
        3) run_eth TP-Hub ;;
        4) run_eth TP-Switch ;;
        5) run_eth TP-Hub-Big ;;
        6) run_5g TP-RAN-DL ;;
        0|q|Q) clear; exit 0 ;;
        *) echo; echo "  Invalid choice. Press Enter to try again."; read ;;
    esac
done
