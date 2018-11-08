ActiveAdmin.register Book do
  permit_params :genre, :author, :image, :title, :editor, :year
end
