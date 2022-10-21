require 'rails_helper'

RSpec.describe User, type: :model do

  it "creates a user successifully with valid data" do
    user=User.create(user_name:"Mercy_k",first_name: "Mercy", last_name: "Kioko",email:"Mercykioko.com",password: "12345",age:25)
    expect(user).to be_valid
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:user_name) }
    it { is_expected.to validate_uniqueness_of(:user_name) }
  end
end
