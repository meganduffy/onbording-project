RSpec.describe User, type: :model do
  user = User.new(first_name: "John",
                  last_name: "Doe",
                  email: "john@unique.com",
                  password: "hard2guess")

  it "is valid with all valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a first name" do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a last name" do
    user.last_name = nil
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it { validate_uniqueness_of(:email) }

  it "is not valid without a properly formatted email" do
    user.email = "notemail.com"
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do
    user.password = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a password that is less than 5 characters" do
    user.password = "1234"
    expect(user).to_not be_valid
  end
end
