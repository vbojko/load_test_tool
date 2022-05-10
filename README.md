# loadtest_tool

This load test tool is intended to test the performance of Application Delivery Controller or load balancing devices.

It is based on the *wrk* tool. Since *wrk* runs on a singe core, the script to execute the command tool is extended to use all cpu cores the client machine has available.

This repo has a compiled binary of the wrk tool for ubuntu 18.04

**general**

We use "wrk" as a performance test tool.

The homepage for wrk can be found here:
https://github.com/wg/wrk

More details how to install wrk can be found here:

https://github.com/wg/wrk/wiki/Installing-Wrk-on-Linux

A compiled version of wrk is in the "binary/ubuntu_18-04" folder. 
Download the "wrk" file to the client device and copy it to /usr/bin

*Note: wrk runs on a single CPU only.*
 
The script "wrkscript.sh" will take the wrk command and runs it on all available cpu cores.


**Load test Client setup**

*Client requirements*
*  ubuntu 18.04
*  2+ cpu cores. the more the better

*Client installation:*

Download this file to the client and make it an executable:

`curl -O https://raw.githubusercontent.com/vbojko/load_test_tool/main/installwrk.sh`

`sudo chmod +x ./installwrk.sh`

`sudo ./installwrk.sh`

This will update ubuntu, download "wrk" binary from this gitlab repo and download "wrkscript.sh"
