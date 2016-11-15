require "plate_edools/version"

module PlateEdools
  def self.plate(str)
    @remove_spaces = str.strip!
    @size = str.length

    if str == ""
      return nil
    elsif @size < 7 || @size > 8
      return false
    end

    @check_plate = str.split("")
    if @check_plate[0] != ['A..Z'] || @check_plate[0] != ['a..z'] &&
      @check_plate[1] != ['A..Z'] || @check_plate[1] != ['a..z'] &&
      @check_plate[2] != ['A..Z'] || @check_plate[2] != ['a..z']
      return false
    end

    if @check_plate[3] != [0..9] || @check_plate[3] != "-"
      return false
    end

    if @check_plate[3] == ['A..Z'] || @check_plate[3] == ['a..z'] ||
      @check_plate[4] == ['A..Z'] || @check_plate[4] == ['a..z'] ||
      @check_plate[5] == ['A..Z'] || @check_plate[5] == ['a..z'] ||
      @check_plate[6] == ['A..Z'] || @check_plate[6] == ['a..z'] ||
      @check_plate[7] == ['A..Z'] || @check_plate[7] == ['a..z']
      return false
    end

    if @check_plate[3] == "-"
      if @check_plate[4] == [0..9] && @check_plate[5] == [0..9] && @check_plate[6] == [0..9] && @check_plate[7] == [0..9]
        return true
      end
    end

    if @check_plate[3] == [0..9]
      if @check_plate[4] == [0..9] && @check_plate[5] == [0..9] && @check_plate[6] == [0..9]
        return true
      end
    end
  end
end
