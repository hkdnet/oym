require 'spec_helper'

describe Oym::Resource do
  context 'with unexist file' do
    class Temp
      extend Oym::Resource
    end
    it do
      expect { Temp.from_yaml('no_such_file_path') }.to raise_error(Oym::Errors::FileMissingError)
    end
  end
end
