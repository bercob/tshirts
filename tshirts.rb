#!/usr/bin/ruby

class TShirtSolver
  def solve(input_file_name)
    @input_file_name = input_file_name
    read_inputs
    calc
    write_solution
  end
  
  private
  
  def read_inputs
    @definers = Array.new
    
    quest = File.open @input_file_name
    @t_shirts_count, @days_count = quest.gets.split(' ').map {|number| number.to_i}
    @t_shirts = quest.gets.split(' ').map {|number| number.to_i}

    if @t_shirts_count != @t_shirts.length
      p 'error: wrong number of t-shirts'
      exit 1
    end

    @days_count.times do
      @definers.push quest.gets.strip
    end
  end
  
  def calc
    @used_t_shirts = Array.new
    t_shirts_order = Array 1..@t_shirts_count
    
    @definers.each do |definer|
      if definer == 'Z'
        @t_shirts[0] += 1
      elsif definer == 'L'
        min_number = @t_shirts.min
        index_of_min_number = @t_shirts.index min_number
        move_item_to_begin_and_set_it @t_shirts, index_of_min_number, min_number + 1
        used_t_shirt_number = t_shirts_order[index_of_min_number]
        move_item_to_begin_and_set_it t_shirts_order, index_of_min_number, used_t_shirt_number
      else
        p "error: unknown definer #{definer}"
        exit 2
      end
      @used_t_shirts.push t_shirts_order[0]
    end
  end
  
  def write_solution
    File.open("sol#{@input_file_name}", 'w').write @used_t_shirts.join("\n") + "\n"
  end
  
  def move_item_to_begin_and_set_it(array, index_from, new_value)
    array.delete_at index_from
    array.unshift new_value
  end
end

TShirtSolver.new.solve 'tshirts_1.txt'
