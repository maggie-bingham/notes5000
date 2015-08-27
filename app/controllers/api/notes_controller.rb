class Api::NotesController < ApplicationController

  def index
    @notes = Note.all
    render :json => @notes.to_json
  end

  def show
    @note = Note.find(params[:id])
    render :json => @note.to_json
  end

  def create
    @note = Note.create(note_params)
    if @note.save
      render :json => @note.to_json
    else
      render :json => @note.errors.to_json
    end
  end

  private

  def note_params
    params.permit(:title, :body)
  end

end
