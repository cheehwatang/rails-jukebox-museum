class JukeboxesController < ApplicationController
  def show
    @jukebox = Jukebox.find(params[:id])
    authorize @jukebox
  end
end
