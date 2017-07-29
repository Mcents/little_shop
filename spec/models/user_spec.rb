require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of(:username) }
  it {should validate_uniqueness_of(:username) }
  it {should validate_presence_of(:password )}

  it "can be created as an admin" do
    user = User.create(username: "penelope",
                       password: "boom",
                       role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = User.create(username: "sammy",
                       password: "pass",
                       role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
