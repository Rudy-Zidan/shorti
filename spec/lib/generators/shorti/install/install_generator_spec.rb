require "generator_spec"
require "./lib/generators/shorti/install/install_generator"

module Shorti
  module Generators
    describe InstallGenerator, type: :generator do
      # Set working dir to root project under dummy_files folder
      root_dir = File.expand_path("../../../../../../dummy_files", __FILE__)
      destination root_dir

      before :all do
        prepare_destination
        run_generator
      end

      it "creates the installation db migration" do
        migration_file = Dir.glob("#{root_dir}/db/migrate/*create_shorten_urls.rb")

        expect(migration_file.size).to eq(1)
      end

      # Delete the dummy_files dir after the tests finished
      after :all do
        FileUtils.rm_rf(Dir[root_dir])
      end
    end
  end
end
