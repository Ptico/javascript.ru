require 'spec_helper'

describe Question do
  describe 'attributes' do
    it { is_expected.to have_db_column(:body).of_type(:text) }
    it { is_expected.to have_db_column(:explanation).of_type(:text).with_options(default: '') }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:quiz) }
    it { is_expected.to have_many(:answers).dependent(:destroy) }
    xit { is_expected.to have_and_belong_to_many(:specialities) }
  end
end
