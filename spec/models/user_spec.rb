require 'rails_helper'

RSpec.describe User, type: :model do
  
  # 1. user is created successifully with valid Data
  # 2. validations : unique username and email.[must be present]
  # 3. Email must be verified[using a regex validations] and confirmed[email sent using sendgrid with a confirmation url]
  # 4. Password: able to login with password.
  # 5. Associations, many searchs should exist.

  it "creates a user successifully with valid data" do
    user=User.create(user_name:"Mercy_k",first_name: "Mercy", last_name: "Kioko",email:"Mercykioko.com",password: "12345",age:25)
    expect(user).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_uniqueness_of(:user_name) }
  end
end
