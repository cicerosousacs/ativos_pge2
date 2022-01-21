class AdminsAtivo::TypesController < AdminsAtivoController

  def index
    @types = Type.all
  end

end
