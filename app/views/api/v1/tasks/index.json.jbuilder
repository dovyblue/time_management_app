json.array! @categories.each do |category|
  json.id category.id
  json.name category.name
  json.icon category.icon
  json.tasks category.tasks.where(user_id: @user_id)
end

# .sort_by { |task| task.name.downcase }