json.array! @messages do |message|
  if user_signed_in?
    json.content message.content
    json.image message.image.url
    json.created_at message.created_at.strftime("%Y年%m月%d日 %H時%M分")
    json.name message.user.name
    json.id message.id
    json.user_id message.user_id
  else
    json.content message.content
    json.image message.image.url
    json.created_at message.created_at.strftime("%Y年%m月%d日 %H時%M分")
    json.name message.store.name
    json.id message.id
    json.store_id message.store_id
  end
end