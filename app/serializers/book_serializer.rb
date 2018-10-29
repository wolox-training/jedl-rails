class BookSerializer < ActiveModel::Serializer
  attributes :id, :author, :title, :image, :publisher, :year, :genre, :created_at, :updated_at

  def image
    return {url: object.image}
  end

  def publisher
    return object.editor
  end
end
