Feature: a fruit in a basquet

  Scenario: warmup echo
    * sending GET /echoME from the web client
    * the server should reply "echoME!"

  Scenario: add 'item1' via GET
    * with a fresh Basquet
    * sending GET /add/item1 from the web client
    * the server should have replied Request to add by GET 'item1' Added at 0
    * the server should have added it at location 0

  Scenario: add 2 items via GET
    * with a fresh Basquet
    * sending GET /add/item1 from the web client
    * the server should have replied Request to add by GET 'item1' Added at 0
    * sending GET /add/item2 from the web client
    * the server should have 2-replied: Request to add by GET 'item2' Added at 1
    * the server should have item2 added at location 1

