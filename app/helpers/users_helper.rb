module UsersHelper
  def choose_new_or_edit_user
    if action_name == 'new' or action_name == 'confirm'
      users_path
    elsif action_name == 'edit'
      user_path
    end
  end
end
