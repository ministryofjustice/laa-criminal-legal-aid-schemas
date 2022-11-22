# LAA Criminal Legal Aid Schemas

JSON schema definitions, fixtures and validator for LAA Apply for criminal legal aid.

Schemas are published versioned with major and minor version and stored in directory [schemas](/schemas).

Initial schema 0.1 is WIP and not intended to be used just yet. It is a minimum schema to have something to start with.

## Installation

For now this gem is not being published to rubygems as it is under heavy development so to use it just add
the following to your Gemfile:

```ruby
gem 'laa-criminal-legal-aid-schemas', 
    github: 'ministryofjustice/laa-criminal-legal-aid-schemas'
```

You can lock it to a specific branch or sha if you want too.

## Usage

Require the library before you use it with:

```ruby
require 'laa_crime_schemas'
```

Then you can use the `LaaCrimeSchemas::Validator` class to validate a document against a specific JSON schema.

For instance, to validate against version `0.1` of the JSON schema:

```ruby
=> LaaCrimeSchemas::Validator.new(document, version: 0.1).valid?
=> true
```

If you don't provide the version to the initialise, then the validator will try to obtain the version from the document itself, 
assuming there is a property named `schema_version`.

```ruby
=> LaaCrimeSchemas::Validator.new(document).valid?
=> true
```

Finally, if you want a detailed collection of all errors found, you can get them with:

```ruby
=> LaaCrimeSchemas::Validator.new(document, version: 0.1).fully_validate
=> [{:schema=>#<Addressable::URI:0x2e40 URI:file://laa-criminal-legal-aid-schemas/schemas/0.1/application.json>, :fragment=>\"#/\", :message=>\"The property '#/' did not contain a required property of 'status' in schema file://laa-criminal-legal-aid-schemas/schemas/0.1/application.json\", :failed_attribute=>\"Required\"}]
```

## Building structs that conforms to the schema

In order to facilitate working with the JSON payloads and responses from the datastore API, this gem also contains a shareable collection of `dry-struct` classes.

For instance, include this gem in your service, and them you can build a struct from an API response like this:

```ruby
require 'laa_crime_schemas'

# payload is a crime application JSON response
app = LaaCrimeSchemas::Structs::CrimeApplication.new(payload)

> app.reference
=> 6000020

> app.client_details.applicant.first_name
=> "John"

# as the struct conforms to the schema, the following is also true:
> LaaCrimeSchemas::Validator.new(app.to_json).valid?
=> true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
