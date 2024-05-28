class AddPrivacyPolicyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :privacy_policy, :boolean, null: false
  end
end
