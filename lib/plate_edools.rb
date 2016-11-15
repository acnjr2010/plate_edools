require "plate_edools/version"

module PlateEdools
  def self.plate(str)
    #removendo os possíveis espaços em branco que podem ser inseridos
    @remove_spaces = str.strip

    #verificação do tamanho da placa
    @size = @remove_spaces.length

    #verificando se foi enviado um campo em branco
    if @remove_spaces == ""
      return nil

    #verificando se foi inserido caracteres a mais no campo da placa, ela pode conter no máximo 8 caracteres levando em conta que foi
    #utilizado um hifen (-) no meio da string
    elsif @size < 7 || @size > 8
      return false
    end

    #quebrando a string em pedaços para verificar se o formato AAA-1234 ou AAA1234 está correto
    @check_plate = @remove_spaces.split("")

    #verificar se os 3 primeiros caracteres são letras
    @letters = @check_plate[0..2].map { |caracters| caracters  }

    if @letters.include?(0..9) || @letters.include?("-")
      return false
    end

    #verificando se colocaram letras em um dos campos destinados somente aos numeros
    if @check_plate[3] == ('A'..'Z') || @check_plate[3] == ('a'..'z') ||
      @check_plate[4] == ('A'..'Z') || @check_plate[4] == ('a'..'z') ||
      @check_plate[5] == ('A'..'Z') || @check_plate[5] == ('a'..'z') ||
      @check_plate[6] == ('A'..'Z') || @check_plate[6] == ('a'..'z') ||
      @check_plate[7] == ('A'..'Z') || @check_plate[7] == ('a'..'z')

      return false
    end

    #verificando se tem hifen seguido dos numeros e passando
    if @check_plate[3] == "-"
      if @check_plate[4] == (0..9) && @check_plate[5] == (0..9) && @check_plate[6] == (0..9) && @check_plate[7] == (0..9)
        puts "verdade"
        return true
      end
    end

    #verificando se não tem hifen e começa os numeros logo depois das letras e passando
    if @check_plate[3] == (0..9)
      if @check_plate[4] == (0..9) && @check_plate[5] == (0..9) && @check_plate[6] == (0..9)
        puts "verdade"
        return true
      end
    end
  end
end
