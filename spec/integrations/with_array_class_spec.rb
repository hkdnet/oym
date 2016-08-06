require 'spec_helper'

context 'primitive values' do
  class Idol < Oym::Base
    attribute :name
    attribute :age
  end

  class Production < Oym::Base
    attribute :idols, klass: Idol, array: true
  end

  let(:path) { File.expand_path('../../fixtures/with_array_class.yml', __FILE__) }
  subject { Production.from_yaml(path) }

  it { expect(subject.idols.first).to be_a Idol }
end
