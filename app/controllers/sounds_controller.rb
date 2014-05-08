class SoundsController < ApplicationController
  respond_to :xml, :html

  def index
    @sounds = Sound.all
  end
end
