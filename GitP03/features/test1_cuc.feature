Feature: a fruit in a basquet

  Scenario: add 'item1' via GET
    * with a fresh Basquet
    * the site is responding
    * sending GET /add/item1 from the web client
    * on 1st add, the server put 'item1' at location 0
    * fetching from 0 indeed produces 'item1'

  Scenario: add 2 items via GET
    * with a fresh Basquet
    * the site is responding
    * sending GET /add/new_1st_item from the web client
    * on 1st add, the server put 'new_1st_item' at location 0
    * sending GET /add/item2 from the web client
    * on 2nd add, the server put 'item2' at location 1
    * fetching from 1 indeed produces 'item2'

