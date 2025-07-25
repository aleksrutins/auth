class Views::Clients::Edit < Views::Base
  def initialize(client)
    @client = client
  end

  def view_template
    div(class: "flex flex-col items-center w-full gap-4") do
      Link(href: root_url, variant: :ghost) { "Home" }
      div(class: "flex flex-row items-center gap-2") do
        Heading(level: 2) { @client.name }
        div(class: "text-green-500", title: "Verified") { h_shield_check } if @client.vetted
        div(class: "text-amber-500", title: "Featured") { h_star } if @client.featured
      end
      Text(weight: "muted") { @client.description }
      div(class: "flex flex-row items-end gap-2") do
        Link(href: @client.support_url, variant: :ghost) { "Support" }
        Link(href: client_url(@client.id), variant: :ghost) { "Finish Editing" }
      end

      Card do
        CardHeader do
          CardTitle { "Verified Redirect URIs" }
        end
        CardContent do
          RedirectUri.where(client_id: @client.id).each do |uri|
            Form(action: update_redirect_uri_url(uri.id), method: "POST", class: "flex flex-row items-stretch gap-2") do
              Input(type: :text, value: uri.uri, name: "uri", placeholder: "https://my.site/auth/callback", class: "flex-1")
              Button(type: :submit, icon: true) { h_pencil }
            end
          end

          Form(action: redirect_uris_url, method: "POST", class: "flex flex-row items-stretch gap-2") do
            Input(type: :text, name: "uri", placeholder: "https://my.site/auth/callback", class: "flex-1")
            Button(type: :submit) { "Add" }
          end
        end
      end
    end
  end
end
