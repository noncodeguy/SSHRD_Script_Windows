<h1 align="center">SSHRD_Script_Windows</h1>

<p align="center">
Create and boot a SSH ramdisk on checkm8 devices, on Windows
</p>

---

## WARNING
1. This tool CANNOT make a ramdisk at the moment. I will add this feature later on.

2. This tool requires some extra components to make it work. If you want some smoother experience, Linux is a better choice.

3. A10X / T2 (and potentially A11) users, please make sure you're using a spare device with NO important data or THINK TWICE before proceeding. Because the modified gaster that had some special workarounds for A10X / T2 was originally ONLY supported on macOS & Linux, I rewrote the Makefile so it could be compiled on Windows, but there's NO gurantee that it would work, the worst scenario is BOOTLOOPING. So beware.

## Stuff You Need
1. A computer running Windows 10 - X64 (apparently if you're seeing this you already have one)

2. An iDevice

3. MSYS2 MINGW64 terminal or Git Bash (MSYS2 is more recommended, for running shell script)

4. WinRa1n (optional but recommended, for entering pwnDFU)

5. Zadig (for installing custom USB driver)

## Supported Devices
A7 - A11 (A10X is still testing). 

## Using

1. Clone the repo into your directory, or just download the zip file.

2. Install Git Bash with the default configs. (DO NOT CHANGE IT UNLESS YOU KNOW WHAT YOU'RE DOING)

You can simply double click the SSHRD_Helper.sh to do the thing, or just simply:

3. Open the SSHRD_Script_Windows directory, right click and you should see "Open Git Bash here".

4. And you can use the ./sshrd.sh as usual...with few exceptions.

## Exceptions
DFU pwning is a bit awkward on Windows, since there's some USB driver issues. There's to options:

### 1. WinRa1n
WinRa1n works well on Windows 10 and above and will load the customized USB driver automatically, simply select "y" when you see "Do you want to pwn manually with WinRa1n? (y/n)", then open WinRa1n, check the "CheckM8" box, follow as it says, when it shows "YourDevice'sName in CheckM8 mode", then your device is successfully pwned.

### 2. gaster (bit deprecated)
gaster requires libusbK while pwning, if you didn't install libusbK via Zadig, gaster will NOT detect your device and WON'T do anything at all. Another awkward state is irecovery requires USBAAPL (the original USB driver for Apple devices), it CANNOT detect devices in DFU mode when libusbK is installed...soooo yeah

To reset the driver back to USBAAPL, simply open Device Manager in Windows, and search for a device named "Apple Mobile Device (DFU Mode)", click "Update Driver", then click "Search for driver automatically", then click continue, the driver will be set back to USBAAPL. However if it didn't, you may need to boot back to normal mode, then re-enter DFU mode. 

## Install Custom Driver via Zadig
1. Download (Zadig)[https://github.com/pbatard/libwdi/releases/download/v1.5.1/zadig-2.9.exe] here. 

2. Open Zadig, select "Options" at the top bar, then check the "List All Devices" box.

3. Go for the bar below. Select a device named "Apple Mobile Device (DFU Mode)" after connecting your device.

4. Look for a green/yellow arrow, select "libusbK (v3.X.X.X)" next to it, then click "Replace Driver", wait for the driver to be installed, while keeping your device connected.

5. And there you go.

There are potentially some extra issues. If I found any more issues, i will push new commits. Stay tuned!
ub.com/plooshi) for KPlooshFinder
