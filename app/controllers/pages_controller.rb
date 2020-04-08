class PagesController < ApplicationController
  before_action :require_user, only: [:secret_page]

  def home
  end

  def secret_page
  end
end
