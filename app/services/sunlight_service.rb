class SunlightService
  def initialize
    @_conn = Faraday.new("https://congress.api.sunlightfoundation.com")
    @_conn.headers["X-APIKEY"] = ENV['sunlight_api_key']
  end

  def legislators(params)
    response = conn.get(('/legislators'), params )
    JSON.parse(response.body, symbolize_names: true)[:results]
  end

private
  def conn
    @_conn
  end
end
