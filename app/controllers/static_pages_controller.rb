class StaticPagesController < ApplicationController
  def index
    @events = Event.first(6)
  end

  def about
  end

  def contact
  end


end
