Feature: a fruit in a basquet

  Scenario: add 'item1' via GET
    * the site is responding
    * with a fresh Basquet
    * with URL /addTextImmediate/item1
    * on 1st add, the server put 'item1' at location 0
    * fetching from 0 indeed produces 'item1'

  Scenario: add 2 items via GET
    * the site is responding
    * with a fresh Basquet
    * with URL /addTextImmediate/new_1st_item
    * on 1st add, the server put 'new_1st_item' at location 0
    * with URL /addTextImmediate/item2
    * on 2nd add, the server put 'item2' at location 1
    * fetching from 1 indeed produces 'item2'

  Scenario: add & store full request, not just data, get data back
    * the site is responding
    * with a fresh Basquet
    * with URL /addRequest/broohaha
    * the server stored httpAdd request at location 0
    * the server brings back from location 0 the request verb payload '/addRequest/broohaha'
    * with URL /addRequest/GrimmStories
    * the server stored httpAdd request at location 1
    * the server brings back from location 1 the request verb payload '/addRequest/GrimmStories'

  Scenario: add & store POST request
    * the site is responding
    * with a fresh Basquet
    * sending POST w 'acData'='oogaPOSTboogo'
    * the server stored the POST request at location 0
    * the server brings back from POST at location 0 the data 'acData'='oogaPOSTboogo'
