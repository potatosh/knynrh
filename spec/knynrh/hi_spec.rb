require 'knynrh'

describe Knynrh::Hi do
  let(:knynrh) do
    Knynrh.new do
      extend Knynrh::Hi
    end
  end

  describe '#launch' do
    it 'should run new Chatroid'
  end
end
