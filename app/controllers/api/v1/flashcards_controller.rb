class Api::V1::FlashcardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashcard, only: [:update, :destroy]

  # GET /api/v1/flashcards
  def index
    @flashcards = current_user.flashcards.page(params[:page]).per(10)
    render json: @flashcards
  end

  # POST /api/v1/flashcards
  def create
    @flashcard = current_user.flashcards.build(flashcard_params)
    if @flashcard.save
      render json: @flashcard, status: :created
    else
      render json: { errors: @flashcard.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PUT/PATCH /api/v1/flashcards/:id
  def update
    if @flashcard.update(flashcard_params)
      render json: @flashcard
    else
      render json: { errors: @flashcard.errors.full_messages }. status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/flashcards/:id
  def destroy
    @flashcard.destroy
    head :no_content
  end

  private

  def set_flashcard
    @flashcard = current_user.flashcards.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors 'Flashcard not found' }, status: :not_found
  end

  def flashcard_params
    params.require(:flashcard).permit(:question, :answer)
  end
end
