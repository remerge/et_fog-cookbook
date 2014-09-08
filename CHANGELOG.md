## 1.1.1

* Pin dependencies to avoid surprises
* Ensure `apt-get update` runs before all else
    - The `build-essential` cookbook was failing on new Ubuntu 12.04 instances

## 1.1.0

* Clean up Test Kitchen config
* Clean up Berksfile
* Add Travis CI testing

## 1.0.7

* Clean up docs

## 1.0.6

* Functionally identical to v1.0.6, just adds Stove publishing to ease shipping to Supermarket

## 1.0.5

* Install Git, as nokogiri (and thus fog) depend upon it for building native extensions

## 1.0.4

* Give up on apt compile time and do the update ourselves--the cookbook is not actually handling it

## 1.0.3

* Install the 'unf' Gem.

## 1.0.2

* Include the apt cookbook (to make sure update runs)
* Set compile time attributes in attributes instead

## 1.0.1

* First rev!
