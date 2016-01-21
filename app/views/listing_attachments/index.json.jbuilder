json.array!(@listing_attachments) do |listing_attachment|
  json.extract! listing_attachment, :id, :listing_id, :avatar
  json.url listing_attachment_url(listing_attachment, format: :json)
end
