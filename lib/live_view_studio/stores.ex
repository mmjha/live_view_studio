defmodule LiveViewStudio.Stores do
  def search_by_zip(zip) do
    :timer.sleep(2000)
    list_stores()
    |> Enum.filter(&(&1.zip == zip))
  end

  def search_by_city(city) do
    list_stores()
    |> Enum.filter(&(&1.city == city))
  end

  def list_stores do
    [
      %{
        name: "Downtown Helena",
        street: "312 Montana Avenue",
        city: "Helena, MT",
        zip: "59602",
        open: true,
        hours: "8am - 10pm M-F",
        phone_number: "010-111-1111"
      },
      %{
        name: "Jane",
        street: "123 kk",
        city: "seoul",
        zip: "12345",
        open: true,
        hours: "8am - 10pm M-F",
        phone_number: "010-112-1111"
      }
    ]
  end

end
