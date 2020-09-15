FactoryBot.define do
  factory :appointment do
    start_datetime { "2020-09-15 15:18:38" }
    end_datetime { "2020-09-15 15:18:38" }
    customer_id { 1 }
    physician_id { 1 }
  end
end
