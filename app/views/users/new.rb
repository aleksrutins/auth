class Views::Users::New < Views::Base
  def view_template
    Card(class: "w-96 mx-auto my-6 p-6") do
      CardHeader do
        h1(class: "text-center text-2xl font-bold") { "Sign Up for Farthergate" }
      end

      Form(method: "post", action: users_url, class: "flex flex-col gap-4 mb-4") do
        Alert(variant: :destructive) { flash[:alert] } if flash[:alert]
        FormField do
          Input(type: "email", name: "email_address", placeholder: "Email")
        end
        FormField do
          Input(type: "password", name: "password", placeholder: "Password")
        end
        FormField do
          Input(type: "password", name: "password_confirmation", placeholder: "Confirm Password")
        end
        Button(type: "submit", class: "btn btn-primary") { "Sign Up" }
      end

      CardFooter do
        div(class: "flex justify-around") do
          Link(href: new_session_url) { "Already have an account?" }
        end
      end
    end
  end
end
