module UsersHelper

  def gravatar_for(user,options={size:80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    image_size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?size=#{image_size}"
    image_tag(gravatar_url, alt: user.name)
  end 

  def admin(user)
    if user.admin?
      button_to 'Remove as Admin', admin_user_url(user), method: :patch, class: "btn"
    else
      link_to 'Set as Admin', admin_user_url(user), method: :patch, class: "btn"
    end 
  end

end







