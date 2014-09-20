json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :name
  json.start appointment.start_at
  json.end appointment.end_at
end