require 'rails_helper'

describe User do
  let(:user) { User.new(email: "test@test.com",
                        password: "test")}
  context 'validations' do
    it 'can save' do
      expect(user.save).to eq true
    end

    it 'wont save if the email is blank' do
      user.email = nil
      expect(user.save).to eq false
      expect(user.errors.full_messages).to eq ["Email can't be blank"]
    end

    it 'wont save if the password is blank' do
      user.password = nil
      expect(user.save).to eq false
      expect(user.errors.full_messages).to eq ["Password can't be blank"]
    end
  end
end
