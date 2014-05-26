require 'spec_helper'

describe Speciality do
  describe 'attributes' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:questions) }
  end
end
