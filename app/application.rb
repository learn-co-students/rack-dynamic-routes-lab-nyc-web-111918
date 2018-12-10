class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match (/items/)

      # if @@items.include?(search_term)
      #   @@items.find { |item| item == search_term }.price
      #   binding.pry
      # end
      food_item = req.path.split("/items/").last
      if @@items.find { |item| item.name == food_item }
        item = @@items.find { |item| item.name == food_item }
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end 

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end #end of Application class
