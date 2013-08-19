Feature: fruits to JSON

  Scenario: Add two numbers as basic warmup test
    * Having entered "2+2"
    * running the calculator
    * should produce "4"

  Scenario: simple fruit list to JSON
    * Making a miniDB w these name:color pairs
      | name    | color   |
      | banana  | yellow  |
      | strawberry | red  |
    * sending GET /fruits from the web client
    * should have gotten back from the server this JSON:
      """
        [
          {"name": "banana",
          "color": "yellow"},
          {"name": "strawberry",
            "color": "red"}
        ]
      """

