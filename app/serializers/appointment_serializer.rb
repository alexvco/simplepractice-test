class AppointmentSerializer
  include FastJsonapi::ObjectSerializer

  attributes :physician_id, :customer_id, :start_datetime, :end_datetime

  attribute :customer_first_name do |appointment|
    "#{appointment.customer.first_name}"
  end

  attribute :physician_first_name do |appointment|
    "#{appointment.physician.first_name}"
  end
end