class Views::Passwords::New < Views::Base
  def view_template
    Card(class: "w-96 mx-auto my-6 p-6") do
      CardHeader {
        h1(class: "text-center text-2xl font-bold") { "Reset Password" }
      }
      Form(method: "post", action: passwords_url, class: "flex flex-col gap-4 mb-4") do
        Alert(variant: :destructive) { flash[:alert] } if flash[:alert]
        FormField do
          Input(type: "email", name: "email_address", placeholder: "Email")
        end
        Button(type: "submit", class: "btn btn-primary") { "Request Reset" }
      end
      CardFooter do
        div(class: "flex justify-around") do
          Link(href: new_session_url) { "Log In" }
        end
      end
    end
  end
end
