// source: https://ligolang.org/docs/language-basics/maps-records

type point is record [x : int; y : int; z : int]
type vector is record [dx : int; dy : int]

const origin : point = record [x = 0; y = 0; z = 0]

function xy_translate (var p : point; const vec : vector) : point is
  p with record [x = p.x + vec.dx; y = p.y + vec.dy]


// nested updates
type color is | Blue | Green

type preferences is record [
  color : color;
  other : int;
]

type account is record [
  id : int;
  preferences : preferences;
]

const usesr1 : account = record [
  id = 1001;
  preferences = record [
    color = Blue;
    other = 1;
    ]
  ]

function change_color_preference (const account : account; const color : color) : account is
  block {
    accout := account with record [preferences.color = color]
  } with account

// Record Patches
type point is record [x : int; y : int; z : int]
type vector is record [dx : int; dy : int]

function xy_translate (var p : point; const vec : vector) : point is 
  block {
    patch p with record [x = p.x + vec.dx];
    patch p with record [y = p.y + vec.dy]
  } with p

