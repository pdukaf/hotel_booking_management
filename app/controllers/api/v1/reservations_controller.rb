module Api
  module V1
    class ReservationsController < ApiController

      def index
        reservations = Reservation.all

        render locals: { reservations: reservations }
      end
    end
  end
end