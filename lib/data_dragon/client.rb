class DataDragon::Client
  HOST = "https://ddragon.leagueoflegends.com"
  REALM_ENDPOINT = "/realms/oce.json"

  HEADERS = {
    "Accept" => "application/json, text/javascript, */*; q=0.01",
    "Accept-Encoding" => "gzip, deflate, sdch",
    "Accept-Language" => ":en-GB,en;q=0.8,en-US;q=0.6",
    "Connection" => "keep-alive"
  }

  def initialize
    @connection = Excon.new(HOST,
      persistent: true,
      middlewares: Excon.defaults[:middlewares] + [Excon::Middleware::Decompress],
      omit_default_port: true
    )
  end

  def request_url(path, &block)
    if block_given?
      @connection.get(path: path, headers: HEADERS, response_block: block)
      nil
    else
      response = @connection.get(path: path, headers: HEADERS)
      response.body
    end
  end

  def retrieve_json(path)
    JSON.parse(request_url(path))
  end

  def realm
    retrieve_json(REALM_ENDPOINT)
  end

  def dragontail(version, &block)
    request_url("/cdn/dragontail-#{version}.tgz", &block)
  end
end