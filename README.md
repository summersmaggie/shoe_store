# Shoe Distribution Company

#### _By Maggie Summers_

#### _An application to store information about a shoe distribution company. 3-2-18_

## Description

_This app allows a user to add, update and delete shoe stores and shoe brands to a database. They can then assign shoe brands to shoe stores, and see which stores are carrying each shoe brand._

### Specifications
    1. User adds new shoe store to database
      * Example input - "Add Store: Store Name: Nordstrom Location: Portland"
      * Example output - "Shoe Stores: Nordstrom, Portland"

    2. User adds new shoe brand to database
      * Example input - "Add Shoe Brand: Brand Name: Lucky Brand Price: 50"
      * Example output - "Shoe Brands: Lucky Brand, $50"

    3. User views shoe stores
      * Example output - "Shoe Stores: 'Nordstrom, Portland', 'REI, Portland', 'Aldo, Nashville'"

    4. User views shoe stores
      * Example output - "Shoe Brands: 'Lucky Brand, $50', 'Keen, $100', 'Converse, $40'"

    5. User adds shoe brands to store
      * Example action - "Add 'Aldo' to 'Nordstrom'"
      * Example output - "Shoe brands available at Nordstrom: Aldo."

    6. User views which shoe brands are available at a store.
      * Example output - "Aldo is available at the following stores: Nordstrom"

## Install the DATABASE instructions

* _Enter into the terminal:_ ``` $postgres```

* _In the following line enter:_ ```$db:migrate```

## Setup/Installation Requirements

  * _Enter in the terminal:_ ``` $ruby app.rb```

  * _Using a web browser, type in the url_ ``` localhost:4567 ```

## Known Bugs

  * _No known bugs at this time._

## Support and contact details

  _To suggest changes, submit a pull request in the GitHub repository._

## Technologies Used

  * Ruby
  * Ruby Gems, including RSpec, Rake, Shoulda-Matchers, Auto_Strip_Attributes
  * Sinatra
  * pSQL
  * ActiveRecord

### License

  *MIT License*

Copyright (c) 2018 **_Maggie Summers**
