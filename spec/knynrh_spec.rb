require 'knynrh'

describe Knynrh do
  describe '#run' do
    it 'should launch each of the services' do
      service_names = ['A', 'B', 'C']
      services = {}.tap {|hash|
        service_names.each do |name|
          hash[name] = Module.new do
            def launch
              nil
            end
          end
        end
      }
      knynrh = Knynrh.new

      knynrh.stub(:service_names).and_return(service_names)
      service_names.each do |name|
        knynrh.should_receive(:find_service).with(name).and_return(services[name])
      end
      # 各モジュールのlaunchが呼び出されていることをexpectしていない
      knynrh.should_receive(:launch).exactly(service_names.length)

      knynrh.run
    end
  end
end
