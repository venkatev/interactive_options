#
# == Interactive Options Parser.
#
# Author:: Vikram Venkatesan
#
# === Introduction
# InteractionOptions can be used for getting user input in an interactive fashion by displaying the user a list of available options and asking to choose one among them.
#
# === Basic example
#   InteractionOptions.get_option(
#     'zone', [
#       {name: 'East',  custom_value: 10},
#       {name: 'West',  custom_value: 11}
#       {name: 'North', custom_value: 12}
#       {name: 'South', custom_value: 13}
#     ]
#   )
#
# will show a prompt to the user as below
#
#   [1] East
#   [2] West
#   [3] North
#   [4] South
#
#   Select a zone: <user input>
#
# Any input outside the list (say 0, 5 or 8) will be not be accepted. The user will be shown an error and displayed the
# prompt again until the user enters a valid option.
#
#   Invalid option. Please enter a number between 1 and 4.
#
class InteractiveOptions
  # Gets user input for the given parameter.
  #
  # +name+::              Name of the attribute. E.g, 'zone'
  # +available_options+:: A list of Hashes, one per option. Each option should contain the key :name, the display text for the option.
  #                       Additional keys can also be specified. For instance, for an attribute named 'zone', a custom option
  #                       could be :total_states or :area.
  #
  def self.get_option(name, available_options)
    while true
      print_options(name, available_options)
      input = gets.strip

      unless input == ''
        option_number = Integer(input)
      end

      if option_number && option_number >= 1 && option_number <= available_options.size
        selected_option = available_options[option_number - 1]
      end

      if option_number && selected_option
        puts "\n"
        return selected_option
      else
        puts "\nInvalid option. Please enter a number between 1 and #{available_options.size}.\n".red
      end
    end
  end

  private

  # Prints the available options
  def self.print_options(name, available_options)
    available_options.each_with_index do |opt, index|
      puts "[#{index + 1}] #{opt[:name]}"
    end

    print "\nSelect #{name}: ".green
  end
end
