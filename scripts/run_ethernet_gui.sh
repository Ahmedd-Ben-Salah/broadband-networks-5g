cd "$HOME/omnetpp-ws/omnetpp-6.1" && . ./setenv -f >/dev/null
cd "$HOME/omnetpp-ws/inet4.5" && . ./setenv -f >/dev/null
cd "$HOME/omnetpp-ws/inet4.5/examples/ethernet/lans"
INET="$HOME/omnetpp-ws/inet4.5"
CFG="${1:-TP-Hub}"
opp_run -u Qtenv -c "$CFG" -l "$INET/src/INET" -n "$INET/src:$INET/examples" tp_lan.ini
