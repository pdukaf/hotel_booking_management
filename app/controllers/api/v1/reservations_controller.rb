module Api
  module V1
    class ReservationsController < ApiController
      before_action :reservation, only: %i[ show update ]
      def index
        reservations = Reservation.all

        render locals: { reservations: reservations }
      end

      def show
        render :show, locals: { reservation: reservation }
      end

      def create
        reservation = Reservation.create!(reservation_params)

        render :show, locals: { reservation: reservation }
      end

      def update
        reservation.update!((reservation_params))

        render :show, locals: { reservation: reservation }
      end

      def destroy
        reservation.destroy!

        head :no_content
      end

      private

      def reservation
        @reservation = Reservation.find(params[:id])
      end

      def reservation_params
        params.require(:reservation).permit(
          %i(hotel_name price currency arrival_date departure_date guest_name guest_email)
        )
      end
    end
  end
end