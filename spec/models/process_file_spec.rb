require 'rails_helper'

RSpec.describe ProcessFile, type: :model do
  it 'has a valid factory' do
    expect(build(:process_file)).to be_valid
  end

  context 'validations' do
    before { create(:process_file) }

    context 'presence' do
      it { validate_presence_of(:type_transaction) }
      it { validate_presence_of(:date) }
      it { validate_presence_of(:value) }
      it { validate_presence_of(:cpf) }
      it { validate_presence_of(:card) }
      it { validate_presence_of(:time) }
      it { validate_presence_of(:owner) }
      it { validate_presence_of(:shop) }
    end
  end
end