# Maps
%{
  a: "b",
  c: "e",
  f: 1
}

%{
  "g" => 6
}

# Lists (Linked lists)
[1, 2, 3, 4, 5]

# Structs
defmodule Person do
  defstruct [:name, :company]
end

%Person{name: "Hylke", company: "Coverwallet"}
%Person{name: "Hylke", age: 30}

# Tuples (Static data structure)
hylke = %Person{name: "Hylke", company: "Coverwallet"}
{:ok, hylke}

