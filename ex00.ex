ExUnit.start
Code.load_file "support.ex"

defmodule Ex00 do
  use ExUnit.Case
  inc = &(&1 + 1)
  assert inc.(2)  == 3
  assert inc.(-1) == 0
end
