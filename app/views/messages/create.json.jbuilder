if user_signed_in?
  json.name @message.user.name
  json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.content @message.content
  json.image @message.image_url
  json.user_id @message.user_id
  json.id @message.id
else
  json.name @message.store.name
  json.created_at @message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.content @message.content
  json.image @message.image_url
  json.store_id @message.store_id
  json.id @message.id
end