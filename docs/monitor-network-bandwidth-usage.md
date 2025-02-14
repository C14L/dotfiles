Monitor network bandwidth usage on Linux
========================================

(from Grok2)

Command Line Tools:

iftop:
iftop provides a real-time view of network bandwidth usage on an interface. 
Installation (on Ubuntu/Debian): sudo apt-get install iftop
Usage: sudo iftop -i eth0 (replace eth0 with your network interface, e.g., wlan0 for Wi-Fi).
nload:
nload gives you a nice graphical display of incoming and outgoing traffic for specified network interfaces.
Installation: sudo apt-get install nload
Usage: nload eth0 (replace eth0 with your interface).
bmon:
bmon is another tool for monitoring bandwidth usage with both a text-based and graphical mode.
Installation: sudo apt-get install bmon
Usage: bmon
iptraf-ng:
For detailed network statistics, iptraf-ng is very useful.
Installation: sudo apt-get install iptraf-ng
Usage: sudo iptraf-ng
netstat or ss:
While not real-time, you can get an overview of network connections with:
netstat -tuna | grep ESTABLISHED or ss -tuna | grep ESTABLISHED for established connections.
watch with ifconfig or ip:
For a simple, periodic check:
watch ifconfig eth0 or watch ip -s link show eth0 (again, replace eth0 with your interface).

For More Detailed Monitoring:

nethogs:
Allows you to see bandwidth usage per process. 
Installation: sudo apt-get install nethogs
Usage: sudo nethogs eth0

Graphical Tools:

GNOME Network Monitor or KDE System Monitor if you're using GNOME or KDE desktops, respectively.
Wireshark for deep packet analysis, though it's more than just monitoring bandwidth.

Example with iftop:

bash
sudo iftop -i eth0
This command will show you a real-time display where you can see which connections are using bandwidth, including downloads. Press 'q' to quit.
