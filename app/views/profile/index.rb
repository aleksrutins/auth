class Views::Profile::Index < Views::Base
  attr_reader :user, :profile

  def initialize(user:, profile:)
    @user = user
    @profile = profile
  end

  def view_template
    div(class: 'flex flex-col w-full') do
      div(class: 'flex flex-row items-center justify-center self-center gap-2') do
        Avatar do
          AvatarImage(src: @profile["avatar_url"], alt: @user.email_address)
          AvatarFallback { @user.email_address[0..1].upcase }
        end
        Heading(level: 2) { @profile["display_name"] }
      end
    end
  end
end
