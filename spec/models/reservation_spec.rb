require 'rails_helper'

describe Reservation do
  describe '#validations' do
    it { is_expected.to validate_presence_of(:hotel_name)}
    it { is_expected.not_to allow_value('').for(:hotel_name)}
    it { is_expected.to validate_presence_of(:price)}
    it { is_expected.not_to allow_value('').for(:price)}
    it { is_expected.to validate_presence_of(:currency)}
    it { is_expected.not_to allow_value('').for(:currency)}
    it { is_expected.to validate_presence_of(:arrival_date)}
    it { is_expected.not_to allow_value('').for(:arrival_date)}
    it { is_expected.to validate_presence_of(:departure_date)}
    it { is_expected.not_to allow_value('').for(:departure_date)}
    it { is_expected.to validate_presence_of(:guest_name)}
    it { is_expected.not_to allow_value('').for(:guest_name)}
    it { is_expected.to validate_presence_of(:guest_email)}
    it { is_expected.not_to allow_value('').for(:guest_email)}
  end
end