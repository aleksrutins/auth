class Views::Profile::Index < Views::Base
  attr_reader :user, :profile

  def initialize(user:, profile:)
    @user = user
    @profile = profile
  end

  def view_template
    div(class: "flex flex-col w-full gap-4") do
      div(class: "flex flex-col items-center gap-4") do
        div(class: "flex flex-row items-center justify-center self-center gap-2") do
          Avatar do
            AvatarImage(src: @profile["avatar_url"], alt: @profile["avatar_alt_text"])
            AvatarFallback { @user.email_address[0..1].upcase }
          end
          Heading(level: 2) { @profile["display_name"] }
          if @user.verified
            div(class: "text-green-500", title: "Verified") { h_shield_check }
          else
            div(class: "text-amber-500", title: "Unverified") { h_shield_exclamation }
          end
        end
        Text(weight: "muted") { @profile["description"] }

        if !@user.verified
          Alert(variant: :warning) do
            h_shield_exclamation
            AlertTitle { "Unverified account" }
            AlertDescription do
              Link(href: url_for("/users/verify/start"), class: "inline p-0 m-0 text-inherit") { "Verify your account" }
              plain(" to create apps or use more secure apps.")
            end
          end
        end

        Form(action: session_url, method: "delete", class: "pl-1") do
          Button(type: "submit", variant: :ghost, class: "cursor-pointer") do
            h_arrow_right_end_on_rectangle
            plain "Log Out"
          end
        end
      end

      Heading(level: 3) { "Featured Apps" }
      div(class: "flex flex-row overflow-auto w-full gap-4") do
        Client.where(featured: true).each { |c| app_card(c) }
      end

      if Rails.env.development? or @user.verified
        Heading(level: 3) { "Your Apps" }

        div(class: "flex flex-row overflow-auto w-full gap-4") do
          Card(as: :a, class: "flex flex-col items-center justify-center p-6 gap-2 text-gray-500 border-dashed cursor-pointer", href: new_client_url) do
            Heading(level: 4) { "Create New" }
          end

          Client.where(user_id: @user.id).each { |c| app_card(c) }
        end
      end
    end
  end

  private
  def app_card(app)
    Card do
      CardHeader do
        div(class: "flex flex-row items-center gap-2") do
          CardTitle { app.name }
          div(class: "text-green-500", title: "Verified") { h_shield_check } if app.vetted
          div(class: "text-amber-500", title: "Featured") { h_star } if app.featured
        end
        CardDescription { app.description }
      end
      CardFooter(class: "flex justify-end gap-x-2") do
        Link(variant: :ghost, href: client_url(app.id), icon: true, class: "hover:text-green-500") { h_eye }
        Link(variant: :ghost, href: edit_client_url(app.id), icon: true, class: "hover:text-amber-500") { h_pencil } if app.user_id == @user.id
        Link(variant: :ghost, href: app.support_url, icon: true, class: "hover:text-blue-500") { h_information_circle }
      end
    end
  end
end
