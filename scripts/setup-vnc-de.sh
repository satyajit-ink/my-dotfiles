#!/bin/bash

# sets up vnc and xfce4

sudo apt update && sudo apt install -y xfce4 xfce4-goodies tightvncserver

STARTUP=$(cat <<-END
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
END
)

echo "$STARTUP" > $HOME/.vnc/xstartup

sudo chmod +x $HOME/.vnc/xstartup

vncserver

echo -e "use below to port forward 5901 to localhost"
echo -e "ssh -L 5901:127.0.0.1:5901 -C -N -l $USER $HOSTNAME"
echo -e "now connect to localhost:5901 using VNC Viewer"