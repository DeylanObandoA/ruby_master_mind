class Jugador
  attr_accessor :nombre
  $colores = ["green","red","yellow","blue"]
  def initialize(nombre)
    @nombre = nombre
    end

    def mi_code
        p $colores
      end
end



