Feature: Verify contact functionality of agilecrm application

  @CreateContactBySerialization
  Scenario Outline: Verify the create contact feature
    Given I create request structure to create contact
      | username  | usha.2310@yopmail.com |
      | password  | CGPYWLPE              |
      | basePath  | /dev/api              |
      | type      | <type>                |
      | source    | <source>              |
      | tags      | <tags>                |
      | firstname | <firstName>           |
      | lastname  | <lastName>            |
      | email     | <email>               |
      | starValue | <starValue>           |
      | leadScore | <leadScore>           |
    When I hit an api to create contact
      | endpoint   | /contacts |
      | pathParam  |           |
      | httpMethod | POST      |
    Then I verify the contact is created successfully <statusCode>

    And I verify newly created contact in get by id api
      | username   | usha.2310@yopmail.com |
      | password   | CGPYWLPE              |
      | basePath   | /dev/api              |
      | endpoint   | /contacts/            |
      | pathParam  |                       |
      | httpMethod | GET                   |

    Examples:
      | valid | type   | leadScore | starValue | tags         | firstName   | lastName   | email   | statusCode |
      | true  | PERSON | 100       | 4         | sanity,smoke | RestAssured | Automation | valid   | 200        |
      | false | PERSON | 89        | 5         | sanity,smoke |             | Automation | valid   | 400        |
      | false | PERSON | 99        | 3         | sanity,smoke | API         |            | valid   | 200        |
      | false | XYZ    | 129       | 2         | sanity,smoke |             |            | valid   | 400        |
      | false | XYZ    | 67        | 4         | sanity,smoke |             | Automation | invalid | 400        |
      | false | XYZ    | 213       | 4         | sanity,smoke |             |            | invalid | 400        |

    Scenario: Verify get all contacts api
      Given I prepare request structure to get all contacts
      When I hit an api to get contacts

