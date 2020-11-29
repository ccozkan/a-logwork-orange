require 'rails_helper'

RSpec.describe Worklog, type: :model do
  let(:user) { User.create(email: 'foo@bar.com', password: '123123')}
  describe 'model consistency' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:starting_at) }
    it { is_expected.to validate_presence_of(:time_type) }
    it { is_expected.to validate_presence_of(:ending_at) }
    it { should define_enum_for(:time_type).with_values([:self_improvement, :dayjob, :side_project]) }

    describe 'consistency_of_time_interval' do
      let(:worklog) { Worklog.new(user_id: user.id, time_type: 1, starting_at: Time.current - 50.minutes)}
      context 'invalid' do
        it do
          worklog.ending_at = Time.current - 1.hour
          expect(worklog.valid?).to eq false
          expect(worklog.errors.messages.values).to include ['ending_at must be greater than starting_at']
        end
      end
      context 'valid' do
        it do
          worklog.ending_at = Time.current + 1.hour
          expect(worklog.valid?).to eq true
        end
      end
    end
  end

  describe '#duration_in_minutes' do
    let(:worklog) { Worklog.new(user_id: user.id, time_type: 1, starting_at: Time.current - 50.minutes, ending_at: Time.current)}

    it do
      expect(worklog.duration_in_minutes).to eq 50
    end
  end
end
