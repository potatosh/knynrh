class Knynrh
  def run
    service_names.each do |service_name|
      extend find_service(service_name)
      launch
    end
  end

  def service_names
    ENV['SERVICE_NAMES'].split(',')
  end

  def find_service(name)
    const_get(name)
  end
end
