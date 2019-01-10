module UsersHelper
  def gravatar_for(user)
	gravatar_url = "https://picsum.photos/200/300/?image=#{user.id}"
	image_tag(gravatar_url,:class => "style_image")
  end
end
