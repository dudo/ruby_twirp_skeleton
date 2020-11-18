# frozen_string_literal: true

require_relative './config/boot'

# Instantiate Service
handler = MyService::Handler.new()
service = MyServiceService.new(handler)

# Mount on webserver
app = proc do |env|
  if env["PATH_INFO"].start_with? "/twirp"
    env["PATH_INFO"] = env["PATH_INFO"].delete_prefix("/twirp")
    service.call(env)
  else
    bad_route_twerr = Twirp::Error.bad_route("Route must have prefix: /twirp")
    Twirp::Service.error_response(bad_route_twerr)
  end
end

run app
