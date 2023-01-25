# Sample decK Dump

Sample config that you can restore on your kong instance

Run the following to load the following config below.

Read more about decK:  https://docs.konghq.com/deck/latest/

```
deck --kong-addr http://admin.elab.com:8001 sync --workspace default --headers "kong-admin-token:xxxx"
```