%% la_strings.pl

:- include('mind_read_texttobr2qb').

use_module(library(pio)).
use_module(library(dcg/basics)).

open_s(File,Mode,Stream) :-
	atom_string(File1,File),
	open(File1,Mode,Stream),!.

string_atom(String,Atom) :-
	atom_string(Atom,String),!.

phrase_from_file_s(string(Output), String) :-
	atom_string(String1,String),
	phrase_from_file(string(Output), String1),!.
	
writeln1(Term) :-
	term_to_atom(Term,Atom),
	writeln(Atom),!.
	
shell1_s(Command) :-
 	atom_string(Command1,Command),
	shell1(Command1),!.
/**	
concat_list(A1,B):-
	A1=[A|List],
	concat_list(A,List,B),!.

concat_list(A,[],A):-!.
concat_list(A,List,B) :-
	List=[Item|Items],
	string_concat(A,Item,C),
	concat_list(C,Items,B).


append_list(A1,B):-
	A1=[A|List],
	append_list(A,List,B),!.

append_list(A,[],A):-!.
append_list(A,List,B) :-
	List=[Item|Items],
	append(A,[Item],C),
	append_list(C,Items,B).

**/
