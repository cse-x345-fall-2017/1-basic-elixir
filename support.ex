defmodule Support do
  @nyi  "not yet implemented"
  def your_anonymous_function(),        do: fn          -> @nyi end
  def your_anonymous_function(_),       do: fn(_)       -> @nyi end
  def your_anonymous_function(_, _),    do: fn(_, _)    -> @nyi end
  def your_anonymous_function(_, _, _), do: fn(_, _, _) -> @nyi end
end
