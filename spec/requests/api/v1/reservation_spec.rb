# frozen_string_literal: true

require 'rails_helper'

describe 'Api::V1::reservations' do
  before :each do 
    Reservation.destroy_all
  end
  describe '#index' do
    let(:request) { get api_v1_reservations_path }

    context 'when reservation exists' do
      let!(:reservation_list) {create_list(:reservation, 3)}

      before { request }

      it 'returns an array of 3 reservations' do
        expect(parsed_response[:data]).is_a? Array
        expect(parsed_response[:data].size).to eq(reservation_list.size)
        expect(response.status).to eq(200)
      end
    end

    context 'when reservations does not exists' do
      before { request }

      it 'returns empty arry' do
         expect(parsed_response[:data]).to be_empty
      end
    end
  end

  describe '#show' do
    context 'when specific reservation exist' do
      let!(:reservation) do
        create(:reservation, hotel_name: 'Test hotel',
               price: 220.00,
               currency: 'euro',
               arrival_date: '20-07-2022',
               departure_date: '30-07-2022',
               guest_name: 'Umesh')
      end

      let(:expected_response) do
        {
            id: {
                '$oid': reservation._id.to_s
            },
            hotel_name: "Test hotel",
            price: 220.00,
            currency: "euro",
            arrival_date: '2022-07-20',
            departure_date: '2022-07-30',
            guest_name: "Umesh",
            guest_email: reservation.guest_email
        }
      end

      it 'returns the searched reservation' do
        get api_v1_reservation_path(reservation)

        expect(parsed_response).to eq(expected_response)
        expect(response.status).to eq(200)
      end
    end

    context 'when the reservation does not exist' do
      it 'returns mongo document not found error' do
        expect {get get api_v1_reservation_path('123')}
          .to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end
  end

  describe '#create' do
    context 'when some of the required fields are not provided' do
      let(:params) do
        {
          reservation: attributes_for(:reservation).except(:hotel_name)
        }
      end

      let(:expected_response) do
        {
          hotel_name: ['can\'t be blank']
        }
      end

      it 'returns can\'t be blank error' do
        post api_v1_reservations_path, params: params
        
        expect(parsed_response).to eq(expected_response)
      end
    end

    context 'when some of the required field set as empty value' do
      let(:params) do
        {
          reservation: attributes_for(:reservation, hotel_name: '')
        }
      end

      let(:expected_response) do
        {
          hotel_name: ['can\'t be blank']
        }
      end

      it 'returns can\'t be blank error' do
        post api_v1_reservations_path, params: params
      
        expect(parsed_response).to eq(expected_response)
      end
    end

    context 'when all the parameters are valid' do
      let!(:reservation) { create(:reservation)}
      let(:params) do
        {
          reservation: attributes_for(:reservation)
        }
      end

      let(:request) { post api_v1_reservations_path, params: params }

      it 'increments the count of reservation by 1' do
        expect { request }.to change(Reservation, :count).from(1).to(2)
      end
    end
  end

  describe '#update' do
    let!(:reservation) { create(:reservation) }
    context 'when required field updated to empty value' do

      let(:params) do
        {
          reservation:
            {price: ''}
        }
      end

      let(:expected_response) do
        {
          price: ['can\'t be blank']
        }
      end

      it 'returns the can\'t be blank error' do
        put api_v1_reservation_path(reservation, params: params)

        expect(parsed_response).to eq(expected_response)
      end
    end

    context 'when all the update parameters are valid' do
      let(:params) do
        {
          reservation:
          {
            hotel_name: 'Update test',
            price: 299.12,
            departure_date: '2022-08-10'
          }
        }
      end

      let(:expected_response) do
        {
            id: {
                '$oid': reservation._id.to_s
            },
            hotel_name: "Update test",
            price: 299.12,
            currency: reservation.currency,
            arrival_date: reservation.arrival_date.to_s,
            departure_date: '2022-08-10',
            guest_name: reservation.guest_name,
            guest_email: reservation.guest_email
        }
      end

      it 'return updated reservation' do
        put api_v1_reservation_path(reservation, params: params)
        
        expect(parsed_response).to eq(expected_response)
      end
    end
  end

  describe '#destroy' do
    let!(:reservation) { create(:reservation)}

    context 'when the reservation not found' do
      it 'returns mongo document not found error' do
        expect {delete get api_v1_reservation_path('123')}
          .to raise_error(Mongoid::Errors::DocumentNotFound)
      end
    end

    context 'when the reservation exist' do
      it 'return empty response' do
        delete api_v1_reservation_path(reservation)

        expect(response.status).to eq(204)
      end
    end
  end
end