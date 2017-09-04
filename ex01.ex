ExUnit.start
Code.load_file "support.ex"

defmodule Ex01 do
  use ExUnit.Case
  ##########################################################
  # Write a function that adds two numbers using fn syntax #
  ##########################################################

  sum2a = fn (x, y) -> x + y end
  assert sum2a.(1, 2)    == 3
  assert sum2a.(-1, 100) == 99

  ##########################################################
  # Write a function that adds two numbers using & syntax  #
  ##########################################################

  sum2b = &(&1 + &2)
  assert sum2b.(1, 2)    == 3
  assert sum2b.(-1, 100) == 99

  #####################################################################
  # Write a function that adds three numbers. Use the fn syntax, and  #
  # use the sum2() function you defined above inside it (so there are #
  # no explicit + operators in your function                          #
  #####################################################################

  sum3a = fn (x, y, z) -> sum2a.(x, sum2a.(y, z)) end
  assert sum3a.(1, 3, 5)  == 9
  assert sum3a.(1, -3, 5) == 3

  ####################################
  # Do the same using the & notation #
  ####################################

  sum3b = &(sum2b.(&1, sum2b.(&2, &3)))
  assert sum3b.(1, 3, 5)  == 9
  assert sum3b.(1, -3, 5) == 3

  ########################################################################
  # Write a function then takes a numeric parameter, and returns another #
  # function. This second function also takes a numeric parameter. When  #
  # you call the second function with a parameter, it returns the        #
  # sum of that parameter and the parameter passed to the first          #
  # function. The examples below will make this clearer :)               #
  ########################################################################

  create_adder = fn(diff) ->
    fn(x) -> x + diff end
  end

  add_2  = create_adder.(2)
  add_99 = create_adder.(99)

  assert add_2.(3)  == 5
  assert add_99.(3) == 102

end
