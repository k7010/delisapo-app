=begin deliveryman_1 = User.create(email: "test3@com", staff_number: "11122", password: "pass1234" )

baggage_1 = Baggage.new(
  address_id: 2,
  block: 1-2-3,
  family_name: "田中",
  first_name: "太郎",
  user_id: deliveryman_1.id
)
baggage_1.save