ActiveAdmin.register User do
  index do
    column :id
    column :number_of_imports do |u|
      u.imports.count
    end
    actions
  end

  show do
    attributes_table do
      row :lastfm_registration_date
      row :lastfm_image_url do |user|
        image_tag user.lastfm_profile_image_url
      end
    end
  end
end