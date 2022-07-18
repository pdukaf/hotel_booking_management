require 'rails_helper'

describe 'Reservations' do

  before :each do 
    Reservation.destroy_all
  end

  let!(:reservation) { create(:reservation) }
  describe '#index' do
    it 'returns success status' do
      get reservations_path

      expect(response.status).to eq(200)
    end
  end

  describe '#show' do

    it'returns success status' do
      get reservation_path(reservation)

      expect(response.status).to eq(200)
    end
  end

  describe '#update' do
    it 'redirects to reservation details page after update and retrun success staus' do
      put reservation_path(reservation, params: {reservation:{hotel_name: 'Raddison Hotel'}})

      expect(response.status).to eq(302)
      reservation.reload
      expect(reservation.hotel_name).to eq('Raddison Hotel')
    end
  end

  describe '#destroy' do
    let(:request) { delete reservation_path(reservation) }

    it 'redirects to root path after destroy' do
      request
      expect(response.status).to eq(302)
    end

    it 'deducts the number of reservations' do
      expect{request}.to change {Reservation.count}.from(1).to(0)
    end
  end
end