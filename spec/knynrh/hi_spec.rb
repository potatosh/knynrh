require 'spec_helper'

describe Knynrh::Hi do
  let(:knynrh) do
    Knynrh.new.extend Knynrh::Hi
  end

  describe '#launch' do
    it 'should run new Chatroid' do
      Chatroid.any_instance.should_receive(:run!)
      knynrh.send(:launch)
    end
  end
end
