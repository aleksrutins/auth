class Views::Clients::New < Views::Base
  def view_template
    Card(class: 'w-96 mx-auto my-6 p-6') do
      CardHeader {
        h1(class: 'text-center text-2xl font-bold') { 'Create Client' }
      }
      Form(method: 'post', action: client_url, class: 'flex flex-col gap-4') do
        FormField do
          Input(type: 'text', name: 'name', placeholder: 'Name')
        end
        FormField do
          Input(type: 'text', name: 'support_url', placeholder: 'Support URL')
        end
        Button(type: 'submit', class: 'btn btn-primary') { 'Create Client' }
        div(class: 'flex justify-around') do
          Link(href: new_password_url) { 'Forgot Password?' }
          Link(href: new_account_url) { 'Create Account' }
        end
      end
    end
  end
end
