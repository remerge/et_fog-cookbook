[![Cookbook Version](https://img.shields.io/cookbook/v/et_fog.svg?style=flat)](https://supermarket.getchef.com/cookbooks/et_fog)
[![Build Status](http://img.shields.io/travis/evertrue/et_fog-cookbook.svg?style=flat)](https://travis-ci.org/evertrue/et_fog-cookbook)

# et_fog cookbook

Installs & configures the Fog Ruby library

# Requirements

# Usage

Include `et_fog::default` in your node’s run list.

# Recipes

## default

1. Installs the necessary dependencies for the `fog` gem.
2. Installs `fog` and `unf`, which helps `fog` play nicely with strings and AWS.

# Author

Author:: EverTrue, Inc. (<devops@evertrue.com>)
