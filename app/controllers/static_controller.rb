class StaticController < ApplicationController

  caches_action: [:about, :contact], layout: false

  def about
  end

  def contact
  end

end
