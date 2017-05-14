json.array! @categories.each do |category|
  json.id category.id
  json.name category.name
  json.icon category.icon
  json.task category.tasks
end

