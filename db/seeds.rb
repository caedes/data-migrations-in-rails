data = []

100_000.times do |i|
  first_name = "'First name ##{i}'"
  last_name = Random.rand(0..1) == 1 ? "'Last name ##{i}'" : "NULL"
  data << "(#{first_name}, #{last_name}, date('now'), date('now'))"
end

insert_query = "INSERT INTO users (`first_name`, `last_name`, `created_at`, `updated_at`) VALUES #{data.join(", ")};"

User.connection.execute insert_query
