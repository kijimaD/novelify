module Api
  module V1
    class CardsController < ApplicationController
      before_action :set_card, only: [:show, :update, :destroy]
      before_action :set_story, only: [:create]

      def index
        cards = Card.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded cards', data: cards }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the cards', data: @card }
      end

      def create
        card = @story.cards.create(card_params)
        if card.save
          render json: { status: 'SUCCESS', data: card }
        else
          render json: { status: 'ERROR', data: card.errors }
        end
      end

      def update
        if @card.update(card_params)
          render json: { status: 'SUCCESS', message: 'Updated the card', data: @card }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @card.errors }
        end
      end

      def destroy
        @card.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the card', data: @card }
      end

      private

      def set_card
        @card = Card.find(params[:id])
      end

      def set_story
        @story = Story.find(params[:story_id])
      end

      def card_params
        params.require(:card).permit(:image)
      end
    end
  end
end
