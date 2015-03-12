# JsonToEnv

JsonToEnv loads JSON into your process environment. If you call
JsonToEnv multiple times, earlier invocations take priority because
anything already in ENV will not be overwritten by JsonToEnv.

## Usage

Given a JSON structure like this one:
```json
{
  "one": "two",
  "three": {
    "four": 5
  }
}
```

Before you need to access environment variables:
```ruby
JsonToEnv.load(json)
```

Now you can access your configuration through ENV:
```ruby
ENV['THREE_FOUR'] == 5
```
