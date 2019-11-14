cclass SongsController < ApplicationController
before_action :set_artist
before_action :set_song, only: [:show, :edit, :update, :destroy]

def index
  @songs = @sub.songs
end

def show
end

def new
  @song = @sub.songss.new
  render partial: "form"
end

def edit
  render partial: "form"
end

def create
  @song = @artist.songs.new(song_params)

  if @song.save
    redirect_to [@artist, @song]
  else
    render :new
  end
end

def update
  if @song.update(song_params)
    redirect_to [@artist, @song]
  else
    render :edit
  end
end

def destroy
  @song.destroy
  redirect_to artist_song_path(@artist)
end

private
  def set_sub
    @artist = Artist.find(params[:artist_id])
  end

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:name, :body)
  end
end