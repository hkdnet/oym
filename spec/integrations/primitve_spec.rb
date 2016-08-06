require 'spec_helper'

context 'primitive values' do
  class Hoge < Oym::Base
    attribute :string
    attribute :number
    attribute :bool
    attribute :arr
    attribute :map
  end

  let(:path) { File.expand_path('../../fixtures/primitive.yml', __FILE__) }
  subject { Hoge.from_yaml(path) }

  it { expect(subject.string).to eq 'string' }
  it { expect(subject.number).to eq 1 }
  it { expect(subject.bool).to eq true }
  it { expect(subject.arr).to eq [true, true, false, false] }
  it { expect(subject.map['positive']).to eq 1 }
  it { expect(subject.map['negative']).to eq(-1) }
end
