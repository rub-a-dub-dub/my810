my810
=====

Introduction
-------------
This project uses a Fujitsu Lifebook U-810 mini-laptop, a roughly 4"x5.25"x1" laptop first manufactured around 2007 that I think makes a great, cheap, hobby platform for software projects, similar to the Pi or Arduino. Unlike these latter solutions, hardware prototyping isn't possible, however, the U810's integrated webcam, Bluetooth, WiFi, Ethernet, VGA, CompactFlash, SD card, audio output, microphone, touchscreen, USB port, integrated mini-keyboard, fingerprint sensor, Li-Ion battery, 1-2GB RAM, 40GB HDD and modest 800 MHz processor make it a very powerful tool for some projects where you may need to integrate several of the above peripherals. Unlike the Pi or Arduino, the U810 isn't a stripped down PC - it was a fully fledged production laptop that was designed to be ultra-portable.

When the U810 first came out, there was a [lot of interest][r1] in getting it to work with Debian. Many of the technologies being used (e.g. touchscreens) didn't have mature driver support and frustrations were plentiful. Thus, I now have the benefit of years of development to try and bring a set of tools that will make the U810 a usefull tool for projects like home automation. 

Scripts
--------
This project is a collection of scripts (right now just one) that a user may execute after a fresh Debian (Wheezy; atleast that's what I tested on) install to get a working U810 system. The table below lists the peripherals that appear to work (once the script executes):
- WiFi
- Ethernet
- touchscreen
- USB port
- integrated mini-keyboard
- webcam
- Bluetooth
- audio output (via speaker-test)

The following peripherals should work (by all accounts), but I haven't gotten around to trying yet:
- VGA
- SD card

These peripherals may or may not work and I haven't tested them yet:
- microphone

These don't work (yet?):
- fingerprint sensor
- CompactFlash: It looks to be confusing the Debian kernel into thinking it is a PCMCIA card

References
----------
The [xinput calibrator][r2] website contains the touchscreen calibration code. If the scripts download fails for some reason (because of a broken link atleast), you can grab the package from there and march on. The webcam driver is [hosted on BitBucket][r3].

[r1]: http://ubuntuforums.org/showthread.php?t=1549473 "Lucid Install on the Fujitsu u810"
[r2]: http://www.freedesktop.org/wiki/Software/xinput_calibrator/ "xinput calibrator"
[r3]: https://bitbucket.org/ahixon/r5u87x/downloads "r5u87x driver"