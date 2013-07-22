require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com", salt: "123123123123", fish:"123123123123")
  end

  subject { @user } # set it to @user

  it { should respond_to (:name) }
  it { should respond_to (:email) }
  it { should be_valid }

  # expect(subject.salt).not_to be_nil
  # expect(subject.fish).not_to be_nil

end
