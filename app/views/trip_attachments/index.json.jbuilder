json.array!(@trip_attachments) do |trip_attachment|
  json.extract! trip_attachment, :id, :trip_id, :avatar
  json.url trip_attachment_url(trip_attachment, format: :json)
end
