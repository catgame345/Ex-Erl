defmodule Main do
  def start do
    getName()
  end

  defp getName do
    :calc.welcome()
    name = IO.gets("\nIngrese su nombre usuario: ") |> String.trim()
    getOperation(name)
  end

  defp getOperation(name) do
    IO.puts "\n1. Suma  2. Resta  3. Multiplicación  4. División"
    operation = IO.gets("\nIngrese el número de la operación que quiera realizar: ") |> String.trim()
    val =
      try do
        {:ok, String.to_integer(operation)}
      rescue
        ArgumentError -> :error
      end

    case val do
      {:ok, op} -> getX(name, :calc.op(op))
      :error -> :input_value
    end
  end

  defp getX(name, op) do
    x = IO.gets("\nIngrese un primer número para la #{op} #{name}: ") |> String.trim()
    val =
      try do
        {:ok, String.to_integer(x)}
      rescue
        ArgumentError -> :error
      end

    case val do
      {:ok, xp} -> getY(name, op, xp)
      :error -> :input_value
    end
  end

  defp getY(name, op, x) do
    y = IO.gets("\nIngrese un segundo número para la #{op} #{name}: ") |> String.trim()
    val =
      try do
        {:ok, String.to_integer(y)}
      rescue
        ArgumentError -> :error
      end

    case val do
      {:ok, yp} -> :calc.calcu(op, x, yp)
      :error -> :input_value
    end
  end
end

Main.start()
