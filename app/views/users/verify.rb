class Views::Users::Verify < Views::Base
  def view_template
    Card(class: "w-96 mx-auto my-6 p-6") do
      CardHeader do
        h1(class: "text-center text-2xl font-bold") { "Verify Account" }
      end

      p { "An email has been sent to your email #{Current.user.email_address}. Click the link in the email to continue." }
    end
  end
end
