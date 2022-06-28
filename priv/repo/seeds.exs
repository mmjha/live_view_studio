# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveViewStudio.Repo.insert!(%LiveViewStudio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias LiveViewStudio.Repo
alias LiveViewStudio.Boats.Boat

%Boat{
  model: "1760 Retriever Jon Deluxe",
  price: "$",
  type: "fishing",
  image: "/images/boats/1760-retriever-jon-deluxe.jpg"
}
|> Repo.insert!()

%Boat{
  model: "1650 Super Hawk",
  price: "$",
  type: "fishing",
  image: "/images/boats/1650-super-hawk.jpg"
}
|> Repo.insert!()
