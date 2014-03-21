LAVA Hacking Sessions
*********************
A LAVA hacking session is a lava-test-shell test that provides remote ssh access to a LAVA device.

Assumptions
===========
 * The user has TCP/IP access to the device

Parameters
==========
 * GATEWAY - The gateway for the network the target device is on (check with your LAVA admins)
 * PUB_KEY - A plain-text string containing the ssh public key(s) you wish to use to connect to the device over ssh
 * testdef - The test definition (distrbution specific)

  * **hacking-session-debian.yaml** - run the hacking session on a Debian or Ubuntu filesystem, *openssh-server will be installed using the package manager*
  * **hacking-session-oe.yaml** - run the hacking session on an Open Embedded filesystem *openssh-server must be installed in the image*
  * **hacking-session-android.yaml** - run the hacking session on an Android filesystem *openssh-server must be installed in the image*

Starting a Hacking Session
==========================
* Create a LAVA job file with your desired target and image
* Add a lava-test-shell action to your LAVA json job file where you want hacking access

.. code:: javascript
  {
      "command": "lava_test_shell",
      "parameters": {
          "testdef_repos": [
              {
                  "git-repo": "http://git.linaro.org/lava-team/hacking-session.git",
                  "testdef": "hacking-session-debian.yaml",
                  "parameters": {
                      "GATEWAY": "10.0.0.1",
                      "PUB_KEY": "PASTE_PUBKEY(S) HERE"
                  }
              }
          ],
          "timeout": 3600
      }    
  }

Connecting to a Hacking Session
===============================
The hacking session test definition will report the commands to ssh within the
LAVA log file.  To access the log file, you can use a web browser; navigate to 
your hacking session and scroll to the end of the job to see instructions

 * This hack session was executed on Linaro's LAVA system, job ID: 116632

  * https://validation.linaro.org/scheduler/job/116632/log_file#L_5_7

SSH tunneling
-------------
If your target device is located on a remote server, as is the case when 
accessing the Linaro LAVA lab, you'll want to tunnel onto the Linaro network
to the device under test

# verify your SSH key is setup and configured to connect

 # ssh -T username@example.com

# Modify your SSH config to allow agent forwarding

.. code::
 Host example.com
   ForwardAgent yes

lava-test-shell helper functions in a hack session
--------------------------------------------------
lava-test-shell helper functions can be found within target in the directory /lava/bin

Record text to the LAVA log
---------------------------
During a hacking session, LAVA is listening to /dev/ttyS0 for the duration of 
the hacking session.  From within the target any text you echo to /dev/ttyS0 
will be recorded within LAVA

 * From within the Test session

  * root@kvm01:~# echo "This is a test statement" > /dev/ttyS0

 * Viewing the output in the LAVA log

  * https://validation.linaro.org/scheduler/job/116632/log_file#L_5_12

Stopping a Hacking Session
==========================
During a hacking session, the target your are connected to can't be used for 
other tasks, to complete your session

 * Cancel the job in the LAVA dashboard

 * Use the helper function 'stop_hacking' from the command-line within the hacking session

About
*****
Linaro Automated Validation Architecture

* Code: https://git.linaro.org/lava-team/hacking-session.git
* Hosted website: https://validation.linaro.org
* Documentation: https://validation.linaro.org/static/docs
* Mailing list: linaro-validation@lists.linaro.org
