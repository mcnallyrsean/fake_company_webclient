class Company

  attr_accessor :id, :company_name, :catchphrase, :buzzword, :bullshiza, :hipster_bob_says
  @@headers = {
    "Accept" => "application/json",
    "Authorization" => "Token token=#{ENV['API_KEY']}",
    "X-User-Email" => "#{ENV['API_EMAIL']}"
  }


  def initialize(input_options)
    @id = input_options['id']
    @company_name = input_options['company_name']
    @catchphrase = input_options['catchphrase']
    @buzzword = input_options['buzzword']
    @bullshiza = input_options['bullshiza']
    @hipster_bob_says = input_options['hipster_bob_says']
  end  

  def jules
    @bullshiza + " you motherfucker."
  end


  def self.all
    company_options_hashes = Unirest.get("#{ENV['API_BASE_URL']}/companies.json",
      headers: @@headers
      ).body
    @companies = []
    company_options_hashes.each do |company_options_hash|
      @companies << Company.new(company_options_hash)
    end
    @companies
  end  

  def self.find_by(input_options)
    id = input_options[:id]
    company_options_hash = Unirest.get("#{ENV['API_BASE_URL']}/companies/#{id}.json",
      headers: @@headers  
      ).body
    Company.new(company_options_hash)
  end

  def self.create(input_options)
    company_options_hash = Unirest.post(
      "#{ENV['API_BASE_URL']}/companies.json", 
      headers: @@headers, 
      parameters: input_options).body
    Company.new(company_options_hash)
  end

  def self.update(input_options)
    Unirest.patch(
      "#{ENV['API_BASE_URL']}/companies/#{id}.json", 
      headers: @@headers, 
      parameters: input_options).body
  end

  def destroy
    @company = Unirest.delete(
      "#{ENV['API_BASE_URL']}/companies/#{id}.json",
      headers: @@headers
      ).body
  end
end