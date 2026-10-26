cd "$HOME/omnetpp-ws/omnetpp-6.1" && . ./setenv -f >/dev/null
cd "$HOME/omnetpp-ws/inet4.5" && . ./setenv -f >/dev/null
cd "$HOME/omnetpp-ws/Simu5G-1.3.0/simulations/NR/standalone"
S5G="$HOME/omnetpp-ws/Simu5G-1.3.0"
INET="$HOME/omnetpp-ws/inet4.5"
CFG="${1:-TP-RAN-DL}"
opp_run -u Qtenv -c "$CFG" -l "$S5G/src/simu5g" -l "$INET/src/INET" -n "$S5G/src:$S5G/simulations:$INET/src:$INET/examples" tp_ran.ini
