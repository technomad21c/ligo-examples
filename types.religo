type point = {x : int, y : int, z : int};
type vector = {dx : int, dy : int};
let origin : point = {x : 0, y : 0, z : 0};
let xy_translate = ((p, vec) : (point, vector)) : string => {"OK!"};

type move = (int, int);
type register = big_map (address, move);

let testbg = (param: big_map(int, string)) : string => {"OK!"};


