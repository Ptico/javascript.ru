require 'spec_helper'

describe Answer do
  describe 'attributes' do
    it { is_expected.to have_db_column(:body).of_type(:text) }
    it { is_expected.to have_db_column(:right).of_type(:boolean).with_options(default: false) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:question) }
  end
end
