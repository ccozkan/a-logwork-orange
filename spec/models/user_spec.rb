require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'model consistency' do
    it { is_expected.to have_many(:worklogs).dependent(:destroy)}
  end

  describe '#total_worklog_duration_in_minutes' do
    let(:user) { FactoryBot.create(:user) }
    let!(:worklog_1) { FactoryBot.create(:worklog, user_id: user.id, starting_at: Time.current - 35.minutes, ending_at: Time.current) }
    let!(:worklog_2) { FactoryBot.create(:worklog, user_id: user.id, starting_at: Time.current - 140.minutes, ending_at: Time.current) }
    let(:not_working_user) { FactoryBot.create(:user, email: 'jamesbond@doubleoseven.uk') }

    context 'of not working user' do
      it { expect(not_working_user.total_worklog_duration_in_minutes).to eq 0 }
    end

    context 'of working user' do
      it { expect(user.total_worklog_duration_in_minutes).to eq 140 + 35 }
    end
  end
end
