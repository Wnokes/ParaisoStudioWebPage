class PagesController < ApplicationController
  def home
  end

  def contact
        @message = Message.new
  end
end
