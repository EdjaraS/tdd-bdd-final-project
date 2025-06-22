Feature: The product store service back-end
    As a Product Store Owner
    I need a RESTful catalog service
    So that I can keep track of all my products

Background:
    Given the following products
        | name       | description     | price   | available | category   |
        | Hat        | A red fedora    | 59.95   | True      | CLOTHS     |
        | Shoes      | Blue shoes      | 120.50  | False     | CLOTHS     |
        | Big Mac    | 1/4 lb burger   | 5.99    | True      | FOOD       |
        | Sheets     | Full bed sheets | 87.00   | True      | HOUSEWARES |

Scenario: The server is running
    When I visit the "Home Page"
    Then I should see "Product Catalog Administration" in the title
    And I should not see "404 Not Found"

Scenario: Create a Product
    When I visit the "Home Page"
    And I set the "Name" to "Hammer"
    And I set the "Description" to "Claw hammer"
    And I select "True" in the "Available" dropdown
    And I select "Tools" in the "Category" dropdown
    And I set the "Price" to "34.95"
    And I press the "Create" button
    Then I should see the message "Success"
    When I copy the "Id" field
    And I press the "Clear" button
    Then the "Id" field should be empty
    And the "Name" field should be empty
    And the "Description" field should be empty
    When I paste the "Id" field
    And I press the "Retrieve" button
    Then I should see the message "Success"
    And I should see "Hammer" in the "Name" field
    And I should see "Claw hammer" in the "Description" field
    And I should see "True" in the "Available" dropdown
    And I should see "Tools" in the "Category" dropdown
    And I should see "34.95" in the "Price" field


Feature: Product Catalog Administration

  As a Product Catalog Administrator
  I want to manage the products in the catalog
  So that I can keep the catalog up to date

  Background:
    Given the following products
      | name   | description     | price | available | category  |
      | Fedora | A red hat       | 12.50 | True      | CLOTHING  |
      | Apple  | A green apple   | 1.99  | True      | FOOD      |

  Scenario: Read a Product
    When I visit the "Product Catalog Administration" home page
    And I enter "1" in the "Product ID" field
    And I press the "Retrieve" button
    Then I should see "Fedora" in the "Name" field
    And I should see "A red hat" in the "Description" field
    And I should see "12.50" in the "Price" field
    And I should see "True" in the "Available" field
    And I should see "CLOTHING" in the "Category" field



  Scenario: Update a Product
    When I visit the "Product Catalog Administration" home page
    And I enter "1" in the "Product ID" field
    And I press the "Retrieve" button
    And I enter "A stylish blue hat" in the "Description" field
    And I press the "Update" button
    Then I should see "A stylish blue hat" in the "Description" field


  Scenario: Delete a Product
    When I enter "Hat" in the "Name" field
    And I press the "Search" button
    Then I should see the message "Success"
    And the "Name" field should contain "Hat"
    When I copy the value from the "Product ID" field
    And I clear the form
    And I paste the copied value into the "Product ID" field
    And I press the "Delete" button
    Then I should see the message "Product has been Deleted!"
    When I press the "Clear" button
    And I press the "Search" button
    Then the product should not appear in the search results


  Scenario: List all Products
    When I press the "Clear" button
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Hat" in the results
    And I should see "Shoes" in the results
    And I should see "Big Mac" in the results
    And I should see "Sheets" in the results

  Scenario: Search for Products by Category
    When I press the "Clear" button
    And I select "Food" in the Category dropdown
    And I press the "Search" button
    Then I should see the message "Success"
    And I should see "Big Mac" in the results
    And I should not see "Hat" in the results
    And I should not see "Shoes" in the results
    And I should not see "Sheets" in the results





