require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'model consistency' do
    it { is_expected.to have_many(:worklogs).dependent(:destroy)}
  end
end
