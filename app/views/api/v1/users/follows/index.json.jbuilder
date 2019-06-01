json.array! @users do |user|
  json.extract! user, :id, :email
  if user.user_images.exists? then
    json.image polymorphic_url(user.user_images.first.profile_image)
  else
    json.image '/assets/icon.png'
  end
end
