### This part will be your general troubleshooting page. I've written basically most troubles I've encountered here. 
# Q1: Why did the script says "ERROR: No device found!" / stuck on "Waiting for USB with VID: 0x5AC, PID: 0x1227"?
This will be the most asked problem for everyone. The "ERROR: No device found!" is an error mesaage produced by irecovery, a crucial tool in booting the ramdisk, detecting the device in recovery/DFU/iBSS recovery mode.
However, irecovery only works when you're using a stock Apple Mobile Device Support USB Driver (will be referred as USBAAPL below). While gaster MUST use libusb-win32/libusbK to detect devices in DFU mode,
then proceed the procedure to pwn the device/decrypt components. If you're not using libusbK as the USB driver for Apple devices, it will produce the output "Waiting for....0x1227", which means it cannot find any DFU mode device.

If I didn't make it clear, here's a chart:
|    | irecovery | gaster |
| --- | --- | --- |
| libusbK | X | √ |
| USBAAPL | √ | X |

# Q2: Where to install libusbK?
Read the readme plz.

# Q3: Any better ideas for DFU pwning besides WinRa1n/gaster?
The King project at https://github.com/pgarba/King is basically ipwnder but can be migrated to Windows, and the best part is it's libusbK-free. Bad part is the success rate of DFU pwning is wayyyyyy too low.
So it's even more deprecated than gaster.

# Q4: Why did sshrd.sh declined midway/didn't work as intented when I use SSHRD_Helper.sh?
If you know how to run sshrd.sh, please just use it in the normal way. This helper tool does contain a bunch (not really) problems. I will commit some fixes later. And if you don't know how to use sshrd.sh, check out the original repo at:
https://github.com/verygenericname/SSHRD_Script

# Q5: Can I use it on macOS / Linux?
People will never choose a fork to eat soup if they got spoons. I mean, using the original SSHRD_Script is way much better.

# Q6: When can this tool make a ramdisk on Windows?
I can take a look into Legacy iOS Kit's codes since it can make the ramdisk while keeping the device in normal mode. The SSHRD_Script requires a pwnDFU mode device because it need to decrypt some crucial components via gaster, and gaster's 
decrypting usage can only be proceeded when device is in pwnDFU mode.
