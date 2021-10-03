ActiveAdmin.register User do
  permit_params :id, :email, :password, :password_confirmation, role_ids: []

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
   tabs do
      tab 'Basic' do
        f.inputs 'Basic Details' do
          f.input :email
          f.input :password
          f.input :password_confirmation
        end
      end

      tab 'Advanced', html_options: { class: 'specific_css_class' } do
        f.inputs 'Advanced Details' do
          f.input :roles
        end
      end
    end
    f.actions
  end

#  controller do
#    def permitted_params
#      params.permit user: [:email, :password, :password_confirmation, :role_ids]
#    end
#  end
end
