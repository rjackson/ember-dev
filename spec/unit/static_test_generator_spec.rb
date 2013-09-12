require 'tmpdir'
require 'pathname'
require 'minitest/autorun'

require_relative '../../lib/ember-dev/static_test_generator'
require_relative '../support/tmpdir_helpers'

module EmberDev
  describe StaticTestGenerator do
    include TmpdirHelpers

    let(:generator) { StaticTestGenerator.new }
    let(:output_directory) { Pathname.new(tmpdir).join('tests') }

    it "accepts the output_dir" do
      assert StaticTestGenerator.new(output_directory: output_directory)
    end

    it "generates an tests/index.html file." do

    end
  end
end
