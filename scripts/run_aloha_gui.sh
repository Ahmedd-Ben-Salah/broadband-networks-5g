cd "$HOME/omnetpp-ws/omnetpp-6.1" && . ./setenv -f >/dev/null
cd "$HOME/omnetpp-ws/omnetpp-6.1/samples/aloha"
CFG="${1:-PureAloha1}"
./aloha -u Qtenv -c "$CFG"
