class Views::Clients::Show < Views::Base
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
        Link(href: edit_client_url(@client.id), variant: :ghost) { "Edit" } if @client.user_id == Current.user.id
      end
    end
  end
end
