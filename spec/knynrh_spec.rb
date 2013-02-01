require 'knynrh'

describe Knynrh do
  let(:knynrh) { Knynrh.new }

  describe '#run' do
    it 'should call Knynrh#launch_service with each service name' do
      service_names = ['A', 'B', 'C']

      knynrh.stub(:service_names).and_return(service_names)
      service_names.each do |name|
        knynrh.should_receive(:launch_service).with(name)
      end

      knynrh.run
    end
  end

  describe '#launch_service' do
    it 'should launch service' do
      service = Module.new do
        def launch
          'service launched'
        end
      end

      knynrh.stub(:find_service).and_return(service)

      knynrh.send(:launch_service, mock).should == 'service launched'
    end

    it 'should launch different services' do
      service1 = Module.new do
        def launch
          'service 1 launched'
        end
      end
      service2 = Module.new do
        def launch
          'service 2 launched'
        end
      end

      knynrh.stub(:find_service).and_return(service1, service2)

      knynrh.send(:launch_service, mock).should == 'service 1 launched'
      knynrh.send(:launch_service, mock).should == 'service 2 launched'
    end
  end
end
