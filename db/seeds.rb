User.create!(
             {
              name: Rails.application.credentials.dig(:super_user, :name),
              email: Rails.application.credentials.dig(:super_user, :email),
              role: Rails.application.credentials.dig(:super_user, :role),
              password: Rails.application.credentials.dig(:super_user, :password)
             }
            )