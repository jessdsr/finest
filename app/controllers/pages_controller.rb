class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]

  def home
  end

  def profile
    @user = current_user
  end

  def forms
  end

  def about
  end
end
