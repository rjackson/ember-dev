require 'rake'
require 'tmpdir'
require 'minitest/autorun'

describe "Can run the full ember-data test suite" do
  def override_gemfile
    gemfile = File.read('Gemfile')
    new_gemfile = gemfile.sub(/^gem ['"]ember-dev['"].*$/, "gem 'ember-dev', :path => '#{@original_working_directory}'")
    File.open('Gemfile', 'w+'){|io| io.write new_gemfile}
  end

  before do
    @tmpdir = Dir.mktmpdir
    at_exit{ FileUtils.remove_entry @tmpdir }

    @original_working_directory = Dir.getwd

    system("git clone --depth=1 https://github.com/emberjs/data.git #{ember_data_path}")

    Dir.chdir ember_data_path
  end

  after do
    Dir.chdir @original_working_directory
  end

  let(:tmpdir) { @tmpdir }
  let(:ember_data_path) { File.join(tmpdir, 'data') }

  it "should be able to run the full ember.js test suite" do
    Bundler.with_clean_env do
      override_gemfile

      assert system("bundle update ember-dev")
      assert system("RUBYOPT='-r#{@original_working_directory}/lib/ember-dev' rake test\\[all]")
    end
  end
end

