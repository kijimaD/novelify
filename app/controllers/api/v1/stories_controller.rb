module Api
  module V1
    class StoriesController < ApplicationController
      before_action :set_story, only: [:show, :update, :destroy]

      def index
        stories = Story.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded stories', data: stories }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the story', data: @story }
      end

      def create
        story = Story.new(story_params)
        if story.save
          render json: { status: 'SUCCESS', data: story }
        else
          render json: { status: 'ERROR', data: story.errors }
        end
      end

      def destroy
        @story.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the story', data: @story }
      end

      def update
        if @story.update(story_params)
          render json: { status: 'SUCCESS', message: 'Updated the story', data: @story }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @story.errors }
        end
      end

      private

      def set_story
        @story = Story.find(params[:id])
      end

      def story_params
        params.require(:story).permit(:title)
      end
    end
  end
end
