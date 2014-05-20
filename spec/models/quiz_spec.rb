require 'spec_helper'

describe Quiz do
  describe 'attributes' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:description).of_type(:text).with_options(default: '') }
  end

  describe 'associations' do
    it { is_expected.to have_many(:questions) }
  end
end
