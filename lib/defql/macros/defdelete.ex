defmodule Defql.Macros.Defdelete do
  @moduledoc false

  alias Defql.Connection

  @doc false
  defmacro defdelete({name, _, params}, [table: table]) when is_atom(name) and is_list(params) and length(params) == 1 and is_atom(table) do
    [first | _] = params
    quote do
      def unquote(name)(unquote_splicing(params)) do
        Connection.delete(
                            unquote(table),
                            unquote(first)
                          )
      end
    end
  end

  @doc false
  defmacro defdelete(_, _) do
    raise ArgumentError, "bla bla bla"
  end
end
