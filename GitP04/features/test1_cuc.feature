Feature: a fruit in a basquet

  Scenario: add 'item1' via GET
    * the site is responding
    * with a fresh Basquet
    * sending GET /textAdd/item1 from the web client
    * on 1st add, the server put 'item1' at location 0
    * fetching from 0 indeed produces 'item1'

  Scenario: add 2 items via GET
    * the site is responding
    * with a fresh Basquet
    * sending GET /textAdd/new_1st_item from the web client
    * on 1st add, the server put 'new_1st_item' at location 0
    * sending GET /textAdd/item2 from the web client
    * on 2nd add, the server put 'item2' at location 1
    * fetching from 1 indeed produces 'item2'

  Scenario: can retrieve a header value
    * the site is responding
    * sending get/getheaderkey/SERVER_NAME answers example.org
    * sending get/getheaderkey/ALISTAIR answers not found

  Scenario: add & store full request, not just data, get data back
    * the site is responding
    * with a fresh Basquet
    * sending '/httpAdd/broohaha'
    * the server stored httpAdd request at location 0
    * the server brings back from location 0 the data '/httpAdd/broohaha'
    * sending '/httpAdd/GrimmStories'
    * the server stored httpAdd request at location 1
    * the server brings back from location 1 the data '/httpAdd/GrimmStories'

  Scenario: add & store POST request
    * the site is responding
    * with a fresh Basquet
    * sending POST w 'acData'='oogaPOSTboogo'
    * sendinghttpPOSTadd acData = oogaPOSTboogo location 0
    * the server brings back from POST at location 0 the data 'oogaPOSTboogo'
