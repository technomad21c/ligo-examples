type point is record [x : int; y : int; z : int]
type vector is record [dx : int; dy : int]

function xy_translate (var p : point; const vec : vector) : point is 
  block {
    patch p with record [x = p.x + vec.dx];
    patch p with record [y = p.y + vec.dy]
  } with p
