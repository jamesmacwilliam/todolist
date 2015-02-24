require 'rails_helper'

describe Project do
  context 'Associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of   :title }
    it { is_expected.to validate_uniqueness_of :title }
  end
end
