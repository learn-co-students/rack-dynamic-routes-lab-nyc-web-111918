class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      search = req.path.split("/items/").last
      search = @@items.find {|item| item.name == search}
      if search.nil?
        resp.write "Error. Item not found"
        resp.status = 400
      else
        resp.write search.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
