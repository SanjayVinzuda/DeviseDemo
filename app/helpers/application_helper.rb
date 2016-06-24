module ApplicationHelper
  def header(text)
    content_for(:header) { text.to_s }
  end


  def full_name
    if user_signed_in?
      @user = current_user
      @user = @user.firstname + " " + @user.lastname
    end
  end
end
