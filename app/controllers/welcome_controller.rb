class WelcomeController < ApplicationController
  def index
    @fortune = pick_random_line
  end

  private

  def pick_random_line
    File.readlines('fortunes.txt').sample
  end
end
