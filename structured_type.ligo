type person is record [
  name : string;
  age  : int;
  addr : string
]

const user_1 : person = record [ name = "Bob Doe"; age = 27; addr = "123 Main St., Vancouver" ]
const name : string = user_1.name
const age: int = user_1.age
const addr : string = user_1.addr

