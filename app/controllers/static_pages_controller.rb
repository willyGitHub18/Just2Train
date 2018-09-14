class StaticPagesController < ApplicationController
  def index
    @events = Event.last(6).reverse
  end

  def about
  end

  def contact
  end


end
