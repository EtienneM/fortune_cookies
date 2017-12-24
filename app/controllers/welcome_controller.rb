class WelcomeController < ApplicationController
  def index
    @fortune = pick_random_line
    @image = [
      'moi_debile.jpg', 'moi.jpg', 'Belette qui tete.jpg', 'titi_dodo.jpg',
      'oim.JPG', 'photox 28.jpg', 'Soirée tarte flambée.jpg',
    ].sample
  end

  private

  def pick_random_line
    File.readlines('fortunes.txt').sample
  end
end
