# Seven Manager Snippet

`seven-mgr` is a Zephyr snippet for UART firmware updates on Seven using
MCUboot and MCUmgr.

The intended use-case for this feature is if you wish to use Seven with out the
need of a SEGGER PLUS Compact.

## Build

Build with sysbuild and enable the snippet:

```bash
west build --sysbuild -p always -b seven/nrf9151/ns app -S seven-mgr -- \
  "-Dmcuboot_EXTRA_CONF_FILE=$(pwd)/../modules/seven-board/boards/id8/seven_nrf9151/snippets/seven-mgr/mcuboot.conf"
```

Flash the initial image over SWD/J-Link:

```bash
west flash
```

After the first flash, firmware images can be uploaded over UART.

## UART Shell

Open the UART shell:

```bash
minicom -D /dev/ttyUSB0 -b 115200
```

Exit minicom before running MCUmgr:

```text
Ctrl-A X
```

## Firmware Update

A helper script is included for the normal upload flow:

```bash
../modules/seven-board/scripts/seven-mgr-upload /dev/ttyUSB0
```

Optional arguments are:

```bash
../modules/seven-board/scripts/seven-mgr-upload <port> <baud> <image>
```

The default image is `build/app/zephyr/zephyr.signed.bin`. The script uploads
the image, marks it for test, resets the board, waits for reboot, and confirms
the new active image. Close minicom before running the script.

Manual flow:

Check the active image:

```bash
mcumgr --conntype serial --connstring '/dev/ttyUSB0,baud=115200' image list
```

Upload a signed image:

```bash
mcumgr --conntype serial --connstring '/dev/ttyUSB0,baud=115200' image upload build/app/zephyr/zephyr.signed.bin
```

Mark the uploaded image as pending:

```bash
mcumgr --conntype serial --connstring '/dev/ttyUSB0,baud=115200' image test <slot-1-hash>
```

Reset into the pending image:

```bash
mcumgr --conntype serial --connstring '/dev/ttyUSB0,baud=115200' reset
```

Confirm the active image:

```bash
mcumgr --conntype serial --connstring '/dev/ttyUSB0,baud=115200' image confirm <active-hash>
```
