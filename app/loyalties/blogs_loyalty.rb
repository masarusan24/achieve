class BlogsLoyalty < ApplicationLoyalty
  def update?
    record.user_id == user.id
  end
end
