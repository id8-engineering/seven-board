## Board overlay and Dts for Seven

To use this tree:
In `west.yml`

```
manifest:
  remotes:
    - name: ncs
      url-base: https://github.com/nrfconnect
    - name: id8
      url-base: https://github.com/id8-engineering

  projects:
    - name: nrf
      remote: ncs
      repo-path: sdk-nrf
      revision: v3.2.1
      import: true

    - name: seven-board
      remote: id8
      repo-path: seven-board
      revision: main
      path: seven-board
```
