class PagesController < ApplicationController


  def mrt
    @mrt = Mrt.all
  end

end
