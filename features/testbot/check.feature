Feature: Check assertion

    Scenario: Check restricted way
        Given the query options
            | geometries  | geojson |
            | annotations | true    |

        Given the node map
            """
            a-1--b--c-2-d
            """

        And the ways
            | nodes |
            | abcd  |
        And the contract extra arguments "--segment-speed-file {speeds_file}"
        And the customize extra arguments "--segment-speed-file {speeds_file}"
        And the speed file
            """
            2,3,0
            """

        When I match I should get
            | trace | matchings     |
            | 12    |   |


    Scenario: Check restricted way 2
        Given the node map
            """
            a-1--b-2-c
            """

        And the ways
            | nodes | oneway |
            | abc   | yes    |
        And the contract extra arguments "--segment-speed-file {speeds_file}"
        And the customize extra arguments "--segment-speed-file {speeds_file}"
        And the speed file
            """
            2,3,0
            """

        When I match I should get
            | trace | matchings     |
            | 12    |   |

    Scenario: Check restricted way 3
        Given the node map
            """
            a-1--b-2-c
            """

        And the ways
            | nodes | oneway |
            | abc   | no  |
        And the contract extra arguments "--segment-speed-file {speeds_file}"
        And the customize extra arguments "--segment-speed-file {speeds_file}"
        And the speed file
            """
            2,3,0
            3,2,0
            """

        When I match I should get
            | trace | matchings     |
            | 12    |   |


    Scenario: Check restricted way 4
        Given the node map
            """
            a-1--b-2-c
            """

        And the ways
            | nodes | oneway |
            | abc   | no  |
        And the contract extra arguments "--segment-speed-file {speeds_file}"
        And the customize extra arguments "--segment-speed-file {speeds_file}"
        And the speed file
            """
            2,3,0
            3,2,0
            """

        When I route I should get
            | from | to | route |
            | 1|2    |   |


    Scenario: Check restricted way 5
        Given the node map
            """
            a-1--b-2-c
            """

        And the ways
            | nodes | oneway |
            | abc   | yes |
        And the contract extra arguments "--segment-speed-file {speeds_file}"
        And the customize extra arguments "--segment-speed-file {speeds_file}"
        And the speed file
            """
            2,3,0
            3,2,0
            """

        When I route I should get
            | from | to | bearings | route |
            |    1 |  2 | 270 270  |       |
