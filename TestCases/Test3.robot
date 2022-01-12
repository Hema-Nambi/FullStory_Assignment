*** Settings ***
Library      Selenium2Library
Test Setup     Set Selenium Timeout     30s
Suite Teardown    Close Website
Resource          resource.robot
Variables         ../PageObjects/locators.py
Variables         ../PageObjects/TestData.py

*** Test Cases ***
Test 3

     Open Website using URL       ${newEggURL}
     #Searching a product
     Check visibility and click element     ${SearchBox}
     Input text    ${SearchBox}       ${product}
     Check visibility and click element     ${icon_search}
    # Click Element         ${link_laptop}

     #Adding Product to cart
     Check visibility and click element     ${Prod_DellLaptop}
     Check visibility and click element     ${btn_AddToCart}
     Sleep    5
     Close Website