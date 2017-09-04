ExUnit.start
Code.load_file "support.ex"

defmodule Ex02 do
  use ExUnit.Case

  ########################################################################
  # Write an anonymous function that takes two numbers and returns a two #
  # element list. The first element of the list will be the sum of the   #
  # numbers, and second should be the difference                         #
  ########################################################################

  list2a = fn (x, y) -> [x + y, x - y] end
  assert list2a.(1, 2)    == [ 3, -1 ]
  assert list2a.(-1, 100) == [ 99, -101 ]

  ##################################
  # Do the same using the & syntax #
  ##################################

  list2b = &([&1 + &2, &1 - &2])
  assert list2b.(1, 2)    == [ 3, -1 ]
  assert list2b.(-1, 100) == [ 99, -101 ]

  ################################################################
  # Write a function that uses pattern matching to return true   #
  # if the first two elements of a list are equal                #
  ################################################################

  first2equal = fn
    ([x, x | _t]) -> true
    (_) -> false
  end
  assert  first2equal.([4, 4, 5, 6, 7])
  assert !first2equal.([4, 5, 6, 7, 8])

end
