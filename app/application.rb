class Application

  @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)

    res = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      found_item = find_item(item_name)
      if found_item
        res.write found_item.price
      else
        res.status = 400
        res.write "Item not found"
      end
    else
      res.status = 404
      res.write "Route not found"
    end
    res.finish

  end

  def find_item(item_name)
    @@items.find{|i| i.name == item_name}
  end
  
end
