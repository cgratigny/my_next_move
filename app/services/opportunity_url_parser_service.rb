class OpportunityUrlParserService < ApplicationService
  attr_accessor :uri

  attr_accessor :parsed_data

  def perform
    response = HTTParty.get(uri)
    html = response.body
    # puts response.body, response.code, response.message, response.headers.inspect

    self.parsed_data = Nokogiri::HTML.parse(html)
    send(build_domain_perform_method)
  rescue => e
    # if there was an error, it was likely due to not being able to parse the url properly
    Honeybadger.notify(e)
    {}
  end

  def build_domain_perform_method
    domain_method = "perform_for_#{get_domain}"
    if respond_to?(domain_method)
      domain_method
    else
      :perform_for_all
    end
  end

  def get_domain
    URI.parse(uri).host.split(".").second
  end

  def perform_for_linkedin
    parts = parsed_data.title.split("hiring")
    {
      name: parts.last.split("|").first.strip,
      company_name: parts.first.strip
    }
  end

  def perform_for_greenhouse
    string = parsed_data.title

    # Find the position of the last occurrence of 'at'
    last_at_index = string.rindex("at")
    {
      name: string[0...last_at_index].strip,
      company_name: string[(last_at_index + 3)..].strip
    }
  end

  def perform_for_all
    {
      name: parsed_data.title
    }
  end
end
