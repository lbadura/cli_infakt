Feature: My bootstrapped app kinda works
  Scenario: App just runs
    When I get help for "clinfakt"
    Then the exit status should be 0
    And the banner should be present
    And the banner should document that this app takes options
    And the following options should be documented:
      |--version|
    And the banner should document that this app takes no arguments
