require 'knynrh/hi'

class Knynrh
  def run
    service_names.each { |name| launch_service(name) }
  end

  private

  def launch_service(name)
    extend find_service(name)
    launch
  end

  def service_names
    ENV['SERVICE_NAMES'].split(',')
  end

  def find_service(name)
    Knynrh.const_get(name)
  rescue NameError
    raise "service '#{name}' not found"
  end
end
