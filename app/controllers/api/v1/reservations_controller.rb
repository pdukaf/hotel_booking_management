module Api
  module V1
    class ReservationsController < ApiController
      before_action :reservation, only: %i[ show ]
      def index
        reservations = Reservation.all

        render locals: { reservations: reservations }
      end

      def show
        render :show, locals: { reservation: reservation }
      end

      private

      def reservation
        @reservation = Reservation.find(params[:id])
      end
    end
  end
end