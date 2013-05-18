# Simple command bus

Send it a command and it will search the root path for a command handler that can execute that command. 

## Convention

Commands are typical ruby symbols
Command handlers must be classes name after the command and must end with 'CommandHandler'. They must also be in a file named after the command that must end with 'command_handler'

## Example
```ruby
bus = CommandBus.config do |config|
  config.root = 'lib/command_handlers'
end

bus.execute(:create_new_account)
```

In this example, command_bus will require 'lib/command_handlers/create_new_account_command_handler' and, instantiate the CreateNewAccountCommandHandler and call execute on it.
