# nodejs_nginx cookbook

This cookbook will install Nodejs and Nginx

To use it import it in your own cookbook and run it in the recipes.

## Learning Outcomes:
- Git, GitHub
- Documentation
- Chef, InSpec, ChefSpec
- Importing cookbooks (this will require our search)
- Attributes, and templates
- TDD
- ERB


## Installation section


## Test

To run the unit test:
```
  chef exec rspec spec
```

To run integration test:
```
  kitchen test
```

## ERB and ice cream cones <% %> and <% %>
ERB is embedded Ruby.

Meaning you can interpolate variable or run Ruby code.

It can then be converted to a string.

ERB is like the f'This is python {hello} ' but for entire documents

#### <% %> allow ruby with no output

#### <%= %> allows ruby with output, meaning printing to the documents
