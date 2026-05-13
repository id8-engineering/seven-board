## Board overlay and Dts for Seven


In order to use seven-nrf9151 as a Zephyr module in a West project, you will need to add seven-nrf9151 to your project's west manifest:

```
manifest:
  projects:
    - name: seven-board
      url-base: https://github.com/id8-engineering
      repo-path: seven-board
      revision: main
      path: modules/seven-nrf9151
```

This repository is a Zephyr module and exposes:

- `board_root: .`
- `dts_root: .`

After `west update`, the board should be available as:

```sh
west build -b seven/nrf9151/ns <app>
```
