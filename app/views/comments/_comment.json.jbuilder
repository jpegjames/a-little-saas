json.extract! comment, :id, :name, :post_id, :body, :created_at, :updated_at
json.url comment_url(comment, format: :json)