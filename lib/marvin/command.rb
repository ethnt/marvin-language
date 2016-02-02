require 'optparse'

module Marvin

  # Command line access for the Runner.
  class Command

    # Parses the command line options and will run a Runner. This essentially
    # allows for access to the Runner (the main event) from the command line.
    #
    # @param [Array] argv Options that are from the command line.
    # @return [Marvin::Runner] The resulting `Runner`.
    def self.parse!(argv)
      
      # A new, empty instance of a Runner.
      runner = Marvin::Runner.new

      # For each option, get a possible value.
      argv.options do |opts|

        # For a file, read out the contents and then attach the source code to
        # the runher.
        opts.on '-f', '--file', 'The source file to compile' do |f|
          # read file contents

          # runner.source_code = contents
        end

        # Prints the version number and exits.
        opts.on '-v', '--version', 'Prints the version number' do
          puts "marvin #{Marvin::VERSION}"

          exit
        end

        # Prints the version number and help dialog.
        opts.on_tail '-h', '--help', 'Prints this help dialog' do
          puts "marvin #{Marvin::VERSION}\n\n"
          puts argv.options

          exit
        end

        opts.parse!
      end

      # Thrusters, engage.
      runner.run!
    end
  end
end
