require 'spec_helper'

context 'primitive values' do
  class Idol < Oym::Base
    attribute :name
    attribute :age
  end

  class Producer < Oym::Base
    attribute :idol, klass: Idol
  end

  let(:path) { File.expand_path('../../fixtures/with_class.yml', __FILE__) }
  subject { Producer.from_yaml(path) }

  it { expect(subject.idol).to be_a Idol }
end
