json.array! @posts do |post|
  json.extract! post, :id, :title, :text, :created_at
end
