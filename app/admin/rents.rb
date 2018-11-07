ActiveAdmin.register Rent do
  permit_params :start_date, :end_date, :user_id, :book_id, :returned_at

  form do |f|
    f.inputs do
      f.input :book_id, as: :select, collection: Book.pluck(:title, :id)
      f.input :user_id, as: :select,
                        collection: User.pluck(Arel.sql("CONCAT(first_name, ' ', last_name)"), :id)
      f.input :start_date, as: :date_select, labels: { year: 'Y', month: 'M', day: 'D' }
      f.input :end_date, as: :date_select, labels: { year: 'Y', month: 'M', day: 'D' }
      f.input :returned_at, as: :date_select, labels: { year: 'Y', month: 'M', day: 'D' }
    end
    f.actions
  end
end
