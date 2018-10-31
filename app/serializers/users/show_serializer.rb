module Users
  class ShowSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :image_url,
               :rents_counter, :comments_counter, :unread_notifications_count

    def image_url
      nil
    end

    def rents_counter
      0
    end

    def comments_counter
      0
    end

    def unread_notifications_count
      0
    end
  end
end
