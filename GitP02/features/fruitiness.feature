Feature: fruit to JSON

  Scenario: Add two numbers
    * the input was "2+2"
    * the calculator was just run
    * the system should reply w "4"

  Scenario: simple fruit list to JSON
    Given the system already knows these name:color pairs
      | name    | color   |
      | banana  | yellow  |
      | strawberry | red  |
    When web client just sent GET /fruits
    Then server should reply w these name:color pairs in JSON:
    """
[
{"name": "banana", "color": "yellow"},
{"name": "strawberry", "color": "red"}
]
"""

