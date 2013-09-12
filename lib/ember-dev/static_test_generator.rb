require 'pathname'

module EmberDev
  class StaticTestGenerator
    attr_accessor :output_directory

    def initialize(options = nil)
      options ||= {}

      self.output_directory = options.fetch(:output_directory) { Pathname.new('dist/tests') }
    end
  end
end
