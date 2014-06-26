## Introduction
InteractionOption can be used for getting user input in an interactive fashion by displaying the user a list of available options and asking to choose one among them.

## Basic example

```ruby

InteractionOption.get_option(
 'zone', [
   {name: 'East',  custom_value: 10},
   {name: 'West',  custom_value: 11}
   {name: 'North', custom_value: 12}
   {name: 'South', custom_value: 13}
 ]
)
```

will show a prompt to the user as below

> [1] East
> 
> [2] West
> 
> [3] North
> 
> [4] South
> 
> Select a zone: <user input>

Any input outside the list (say 0, 5 or 8) will be not be accepted. The user will be shown an error and displayed the
prompt again until the user enters a valid option.

> Invalid option. Please enter a number between 1 and 4.