class Views::Clients::New < Views::Base
  def view_template
    Card(class: "w-96 mx-auto my-6 p-6") do
      CardHeader {
        h1(class: "text-center text-2xl font-bold") { "Create Client" }
      }
      Form(method: "post", action: clients_url, class: "flex flex-col gap-4") do
        FormField do
          Input(type: "text", name: "name", placeholder: "Name")
        end
        FormField do
          Textarea(name: "description", placeholder: "Description")
        end
        FormField do
          Input(type: "text", name: "support_url", placeholder: "Support URL")
        end
        FormField(class: "flex flex-row items-center gap-2") do
          Checkbox(id: "require_verification", name: "require_verification", class: "block m-0")
          label(for: "require_verification", class: "block") { "Require additional verification at login" }
        end
        Button(type: "submit", class: "btn btn-primary") { "Create Client" }
      end
    end
  end
end
