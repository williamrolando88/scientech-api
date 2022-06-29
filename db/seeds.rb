# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

=begin 

super_user:
  email: it@scientech-ec.com
  name: Super User
  role: super_user
  password: $CJ5lGi*^R^S@#qWRrOt


=end

User.create!(
             {
              name: Rails.application.credentials.dig(:super_user, :name),
              email: Rails.application.credentials.dig(:super_user, :email),
              role: Rails.application.credentials.dig(:super_user, :role),
              password: Rails.application.credentials.dig(:super_user, :password)
             }
            )