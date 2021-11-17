require 'rails_helper'
RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:api_key) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:api_key) }
  end
  before :each do
  end
  describe 'class methods' do
    describe '.find_by_email' do
      it 'finds one record by email attribute' do
        @user_1 = User.create!(email: "blahblah@gmail.com", password: "abc123", api_key: "auige2qiueb24852qq192jwsx")
        @user_2 = User.create!(email: "blah@gmail.com", password: "abc123", api_key: "rhweifsnjkauqi357fsa1213xc")


        expected = User.find_by_email("blah@gmail.com")
        expect(expected).to be_an(User)
        expect(expected).to eq(@user_2)
      end
    end
  end
  describe 'instance methods' do
    describe '#' do
    end
  end
end
