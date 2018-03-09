class StatController < ApplicationController
  def gra1
    # authorize! :gra1, @information_system
  end

  def gra2
    authorize! :gra2, ""
  end
end
