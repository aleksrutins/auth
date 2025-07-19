class Views::Profile::Index < Views::Base
  attr_reader :user, :profile

  def initialize(user:, profile:)
    @user = user
    @profile = profile
  end

  def view_template
    div(class: "flex flex-col w-full") do
      div(class: "flex flex-col items-center gap-4") do
        div(class: "flex flex-row items-center justify-center self-center gap-2") do
          Avatar do
            AvatarImage(src: @profile["avatar_url"], alt: @profile["avatar_alt_text"])
            AvatarFallback { @user.email_address[0..1].upcase }
          end
          Heading(level: 2) { @profile["display_name"] }
        end
        Text(weight: "muted") { @profile["description"] }
        Form(action: session_url, method: "delete", class: "pl-1") do
          Button(type: "submit", variant: :ghost) do
            raw safe h_arrow_right_end_on_rectangle
            plain "Log Out"
          end
        end
      end
    end
  end
end
