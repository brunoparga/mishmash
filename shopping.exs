defmodule Shopping do
  def list do
    shopping = [
      {"1 dozen", "eggs"},
      {"1 ripe", "melon"},
      {"4", "apples"},
      {"2 boxes", "tea"}
    ]

    template = """
     quantity | item
     ---------|---------
    <%= for {quantity, item} <- list do %>
      <%= quantity |> String.pad_leading(7)%> | <%= item %>
    <% end %>
    """

    IO.puts(EEx.eval_string(template, [list: shopping], trim: true))
  end
end

Shopping.list
