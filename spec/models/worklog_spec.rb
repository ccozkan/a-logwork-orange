require 'rails_helper'

RSpec.describe Worklog, type: :model do
  describe 'model consistency' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:starting_at) }
    it { is_expected.to validate_presence_of(:time_type) }
    it { is_expected.to validate_presence_of(:ending_at) }
    it { should define_enum_for(:time_type).with_values([:self_improvement, :dayjob, :side_project]) }
  end
end
