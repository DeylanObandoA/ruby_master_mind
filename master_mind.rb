    require "colorize"
    require_relative "jugador"
    require_relative "cpu"
    class Mastermind

      $COLORES = ["green","red","yellow","blue","cyan","magenta"]
      $array_vacio=[]

      def initialize 
        puts "Ingresa tu nombre:"
        nombre_jugador = gets.chomp
        @jugador = Jugador.new(nombre_jugador)
        @intentos_maximos=12
        @win_condition = codigo_s
        @colores = $COLORES
      end



    
      def jugar
      puts "El codigo secreto era #{@win_condition.join(', ')}"

      puts "Desea ser el Adivinador (a) o el Creador (c)"
      respuesta = gets.chomp.downcase
      if respuesta == "a"
        puts "Tienes que adivinar el codigo secreto que creo 
        la maquina, tus colores a usar son los siguentes"
        @colores.each do |color|
        print color.colorize(color.to_sym) + " "
        end
      end
      @intentos_maximos.times do |intentos_maximos|
        puts "intento ##{intentos_maximos + 1}".light_red
        guess = get_guess
        result = check_guess(guess)
        if result[:exact] == 4  
          puts "!Felicidades¡ Has adivinado el codigo secreto.".light_cyan
          break
        else
          puts "Resultado #{result[:exact]} bien, #{result[:partial]} parcialmente bien".light_yellow
        end
      end
      puts "El codigo secreto era #{@win_condition.join(', ')}".magenta
      puts "Fin del juego".light_magenta
      end

def codigo_s
$COLORES.sample(4)
end

def get_guess
  puts "ingrese la combinacion que cree ser correcta".light_black
  gets.chomp.split
end


  def check_guess(guess)
    exact = 0
    partial = 0
    guess.each_with_index do |color, index|
    if color == @win_condition[index]
    exact += 1
    elsif @win_condition.include?(color)
  partial += 1         
  end       
  end          
  { exact: exact, partial: partial }     
  end   
  end


      puts "Bienvenido al juego de MASTER MIND"
  empezar = Mastermind.new

  empezar.jugar    