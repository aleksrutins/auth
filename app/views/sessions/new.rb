class Views::Sessions::New < Views::Base
  def initialize(continue_client = nil)
    @continue_client = continue_client
  end

  def view_template
    Card(class: 'w-96 mx-auto my-6 p-6') do
      CardHeader {
        h1(class: 'text-center text-2xl font-bold') { 'Log In to Farthergate' }
        p {
          plain 'to continue to '
          Link(href: @continue_client.url) { @continue_client.name }
        } if @continue_client
      }
      Form(method: 'post', action: session_url, class: 'flex flex-col gap-4 mb-4') do
        Alert(variant: :destructive) { flash[:alert] } if flash[:alert]
        FormField do
          Input(type: 'email', name: 'email_address', placeholder: 'Email')
        end
        FormField do
          Input(type: 'password', name: 'password', placeholder: 'Password')
        end
        Button(type: 'submit', class: 'btn btn-primary') { 'Log In' }
      end
      CardFooter do
        div(class: 'flex justify-around') do
          Link(href: new_password_url) { 'Forgot Password?' }
          Link(href: new_user_url) { 'Create Account' }
        end
      end
    end
  end
end
