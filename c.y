%%

start: function | structure |;

function: type id left_parenthesis parameter right_parenthesis left_braces declaration body right_braces |;

structure: STRUCT id left_braces declaration right_braces|;

declaration: dlist|;

dlist: D | dlist semicolon D;

D: type L;

type: INT | FLOAT ;

L: id | L comma id ;



%%