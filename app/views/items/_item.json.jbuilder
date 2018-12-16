json.extract! item, :id, :item_name, :image, :qty_in_stock, :price, :description, :created_at, :updated_at
json.url item_url(item, format: :json)
