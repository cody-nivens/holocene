class AddUserToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :user_id, :bigint
    
    user = User.where(email: 'palo@alto.com')[0]
    Character.all.each do |char|
      char.update_attribute(:user_id, user.id)
      char.save
    end
  end
end
