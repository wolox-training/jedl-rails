module Users
  class ShowSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :email, :image_url,
               :rents_counter, :comments_counter, :unread_notifications_count

    def image_url
      nil
    end

    def rents_counter
      object.rents.count
    end

    def comments_counter
      #TODO, change this value when comments are added
      0
    end

    def unread_notifications_count
      #TODO, change this value when notifications are added
      0
    end
  end
end
