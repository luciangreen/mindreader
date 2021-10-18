/**
WORKING

make_mind_reading_tree4(["abc","abd"],
[[1, "b", 3], [3, "c", [-, "abc"]], [3, "d", [-, "abd"]]]).

make_mind_reading_tree4(["aaa","aab","acc"],
[[1,"a",2],[2,"a",3],[2,"c",[-,"acc"]],[3,"a",[-,"aaa"]],[3,"b",[-,"aab"]]]).

make_mind_reading_tree4(["cca","ccb"],
[[1, "c", 3], [3, "a", [-, "cca"]], [3, "b", [-, "ccb"]]]).



make_mind_reading_tree4(["acc","bcc"],
[[1, "a", [-, "acc"]], [1, "b", [-, "bcc"]]]).

make_mind_reading_tree4(["ac","bc"],
[[1, "a", [-, "ac"]], [1, "b", [-, "bc"]]]).

make_mind_reading_tree4(["aqa","awx","awy"],
[[1,"a",2],[2,"q",[-,"aqa"]],[2,"w",9],[9,"x",[-,"awx"]],[9,"y",[-,"awy"]]]
).

make_mind_reading_tree4(["ca","cb"],
[[1, "c", 2], [2, "a", [-, "ca"]], [2, "b", [-, "cb"]]]). 

make_mind_reading_tree4(["abc","ade"],
[[1, "a", 2], [2, "b", [-, "abc"]], [2, "d", [-, "ade"]]]).


make_mind_reading_tree4(["cccbbb"],
[[1, "b", [-, "cccbbb"]]]).

make_mind_reading_tree4(["cccbbb","fsfs"],
[[1, "c", [-, "cccbbb"]], [1, "f", [-, "fsfs"]]]).

make_mind_reading_tree4(["abcde"],
[[1, "e", [-, "abcde"]]]).

make_mind_reading_tree4(["abcde","afgde"],
[[1, "a", 2], [2, "b", [-, "abcde"]], [2, "f", [-, "afgde"]]]).


make_mind_reading_tree4(["aaaabbbbcccc","aaaaddddeeee"],
[[1,"a",5],[5,"b",[-,"aaaabbbbcccc"]],[5,"d",[-,"aaaaddddeeee"]]]).

make_mind_reading_tree4(["aaaccc","bbbccc"],
[[1, "a", [-, "aaaccc"]], [1, "b", [-, "bbbccc"]]]).

**/

:- include('../listprologinterpreter/la_strings.pl').

make_mind_reading_tree4(Options0,Options3) :-
	sort(Options0,Options1),
	abort_if_empty_string(Options1),
	string_to_list1(Options1,1,_,[],Options2),
	maplist(append,[Options2],[Options2a]),
%writeln1(merge_lists1a(Options2,Options2a,Options3a)),
	make_mind_reading_tree4_a(Options2a,Options3).

/**
make_mind_reading_tree4_a1(Options2a,Options3) :-
	make_mind_reading_tree4_a(Options2a,Options3a),
	make_mind_reading_tree4_a(Options3a,Options3b),
	(Options3a=Options3b->Options3=Options3a;
	make_mind_reading_tree4_a1(Options3b,Options3)).
**/

make_mind_reading_tree4_a(Options2a,Options3) :-
	%trace,
	merge_lists_a([1],Options2a,[],%%Options2a,
	Options3a),
%writeln1(merge_lists_a([1],Options2a,[],%%Options2a,
%	Options3a)),
	sort(Options3a,Options3c),
	%trace,
	remove_chains_of_one_child_a([1],Options3c,[],Options3b),
	%writeln1(remove_chains_of_one_child_a([1],Options3c,[],Options3b)),
	sort(Options3b,Options3),!.
	

string_to_list1([],N,N,Options,Options) :- !.
string_to_list1(Options1,N1,N2,Options2a,Options2b) :-
	Options1=[B|Rest],
	%%findall(C,(member(B,Options1),
	string_to_list2(B,B,N1,N3,Options2a,Options2c),%%),Options2).
	%%trace,
	[Options2c]=Options2d,
%%trace,
	string_to_list1(Rest,N3,N2,[],Options2e),
	%%trace,
	Options2d=[[[_,D1,D2]|D3]],
	Options2f=[[[1,D1,D2]|D3]],
	append(Options2f,Options2e,Options2b).

string_to_list2(B,B1,N1,N2,A1,A2) :- 
	string_concat(D,"",B),
	string_length(D,1),
	append(A1,[[N1,D,[-,B1]]],A2),
	N2 is N1 + 1,!.
string_to_list2(A,B1,N1,N2,B,C) :-
	string_concat(D,E,A),
	string_length(D,1),
	N3 is N1 + 1,
	append(B,[[N1,D,N3]],F),
	%%maplist(append,[[B,D]],[F]),
	string_to_list2(E,B1,N3,N2,F,C).


merge_lists_a([],Options1,Options2,Options3) :- 
	append(Options1,Options2,Options3),!. %*?
%merge_lists_a([[-,A]],Options0,Options1,Options2) :- 
%	member([N,A1,[-,A]],Options0),
%	append(Options1,[[N,A1,[-,A]]],Options2),!.
%%writeln1(merge_lists_a([-,_],_,Options,Options)),!.
merge_lists_a(N1,Options1,Options2,
Options3) :-
	%trace,
	N1=[M1|Ms],
	abort_if_gone_past_error(M1,Options1),
%writeln1([n1,N1]),
	% If all As lead to the same letter then merge them
	findall(A,(member([M1,A,_N2],Options1)),A1),
	sort(A1,A11),
	% next n1
	merge_lists_a1(M1,A11,Options1,[],Options31,[],N21),
	append(Options2,Options31,Options32),
	append(Ms,N21,M21),
	sort(M21,M2),
	%M21=M2,
	merge_lists_a(M2,Options32,[],Options3).
	%sort(Options32,Options3).


merge_lists_a1(_,[],Options1,Options2,Options3,N,N) :- 
	append(Options1,Options2,Options3),!. %*?
merge_lists_a1(N1,A1,Options1,Options2,Options3,NA61,NA7) :-
	%(N1=2->trace;true),
	%writeln1(merge_lists_a1(N1,A1,Options1,Options2,Options3,NA61,NA7)),
	%notrace,
	A1=[A2|A3],
	findall([N2,A5,N3],(member([N1,A2,N2],Options1),
	member([N2,A5,N3],Options1)),A4),
	%findall([-,_],(member([N1,A2,[-,_]],Options1)),A41),
	findall([N1,A2,N2],(member([N1,A2,N2],Options1)),A6),
	(%trace,
	(merge_lists_a2(A4)
	%->true;(length(A41,L),length(Options1,L)
	)->
	(
	
	%% merge N1 A2 N*, change N* in other states
	%trace,
	merge_lists_a3(A6,Options1,Options4),
	findall(N2,(member([N1,A2,N2],Options4)),NA6));
	%(trace,
	(%trace,
	%subtract(A6,
	merge_lists_a3(A6,Options1,Options4),
	%NA6=[]
	findall(N2,(member([N1,A2,N2],Options4)),NA6) %**
	)),
	append(Options2,Options4,Options5),
	append(NA61,NA6,NA62),
	%Options2=Options4),
	%trace,
	%delete(Options1,[N1,A2,N2],Options1a),
	merge_lists_a1(N1,A3,Options5,[],Options3,NA62,NA7).
	%%sort(Options31,Options3).
 %*?o4
%end state

merge_lists_a2(A4)	:-
	A4=[[_N1,A,_N2]|A5],
	merge_lists_a22(A,A5).
merge_lists_a22(_A,[]) :- !.
merge_lists_a22(A,A5) :-
	A5=[[_N1,A,_N2]|A6],
	merge_lists_a22(A,A6).

merge_lists_a3(A6,Options1,%Options2,
Options3) :-
	A6=[[N1,A,N2]|A8],
	delete(Options1,[N1,A,_],Options1a),
	%%(member([N1,A,N2],Options2)->(trace,Options2=Options2a,A9=A6);
	(append(Options1a,[[N1,A,N2]],Options1aa)%%,A9=A8
	),%),
	merge_lists_a4(N2,A8,Options1aa,[],%Options2a,
	Options3).


merge_lists_a4(_N2,[],Options1,Options2,Options3
) :- 
	append(Options1,Options2,Options3),!.
merge_lists_a4(N2,A8,Options1,Options2,Options3) :-
%trace,
%writeln1(merge_lists_a4(N2,A8,Options1,Options2,Options3)),
	A8=[[N1,A,N3]|A9],
	delete(Options1,[N1,A,N3],Options2aa),
	%%append(Options2,[[N1,A,N2]],Options2a),
	%trace,
	merge_lists_a5(N2,N3,Options2aa,[],Options4,[],Options5),
	% remove Options4=[n from o5
	findall(N4,(member([N4,_,_],Options4)),N41),
	subtract1(Options5,N41,[],Options45),
	append(Options2,Options45,Options245),
	%union(Options4,Options5,Options45),
	%writeln1(Options45),
%writeln1(	merge_lists_a5(N2,N3,Options1,Options2,Options4,[],Options5)),
	merge_lists_a4(N2,A9,Options245,[],%***Options4,
	Options31),
	%(N2=2->trace;true),
	append(Options31,Options4,Options3).
	%(Options4=[[2, "a", 3], [2, "a", 6]]->true;notrace).
	%append(Options45,Options31,Options3).

% point second in pair to changed first state
merge_lists_a5(_N2,_N3,[],Options1,Options1,Options2,Options2) :- !.
merge_lists_a5(N2,N3,Options1,Options2,Options4,Options5,Options6) :-
%(N2=3->trace;true),
	Options1=[[N3,A,N4]|A9],
	delete(Options2,[N3,A,N4],Options2aa),
	%trace,
	append(Options2aa,[[N2,A,N4]],Options2a),
	merge_lists_a5(N2,N3,A9,Options2a,Options4,Options5,Options6).
merge_lists_a5(N2,N3,Options1,Options2,Options4,Options5,Options6) :-
	Options1=[[N2,A,N4]|A9],
	delete(Options2,[N3,A,N4],Options2aa),
	%trace,
	append(Options2aa,[[N2,A,N4]],Options2a),
	merge_lists_a5(N2,N3,A9,Options2a,Options4,Options5,Options6).
merge_lists_a5(N2,N3,Options1,Options2,Options4,Options5,Options6) :-
	Options1=[[N31,A,N4]|A9],
	not(N2=N31),
	append(Options5,[[N31,A,N4]],Options5a),
	merge_lists_a5(N2,N3,A9,Options2,Options4,Options5a,Options6).

subtract1([],_N41,Options45,Options45) :- !.
subtract1(Options5,N41,Options451,Options45) :-
	Options5=[[N42,_,_]|Options51],
	member(N42,N41),
	subtract1(Options51,N41,Options451,Options45).
subtract1(Options5,N41,Options451,Options45) :-
	Options5=[[N42,A,B]|Options51],
	not(member(N42,N41)),
	append(Options451,[[N42,A,B]],Options452),
	subtract1(Options51,N41,Options452,Options45).

subtract2([],_N41,Options45,Options45) :- !.
subtract2(Options5,N41,Options451,Options45) :-
	Options5=[[_,N42,_]|Options51],
	member(N42,N41),
	subtract2(Options51,N41,Options451,Options45).
subtract2(Options5,N41,Options451,Options45) :-
	Options5=[[N42,A,B]|Options51],
	not(member(A,N41)),
	append(Options451,[[N42,A,B]],Options452),
	subtract2(Options51,N41,Options452,Options45).

abort_if_gone_past_error(M1,Options1) :-
	%trace,
	((member([M1,A,N22],Options1),member([M1,A,N23],Options1),not(N22=N23),not(N22=[-,_]),N23=[-,_])->(term_to_atom([M1,A,N22],N221),term_to_atom([M1,A,N23],N231),concat_list(["Error: Conflicting branches ",N221," and ",N231,"."],W),writeln1(W),abort);true),!.

abort_if_empty_string(Options1) :-
	(member("",Options1)->(writeln1("Error: Cannot mind read \"\"."),abort);true),!.

/**


merge_lists1a([],Options,Options) :- !.
merge_lists1a(Options1,Options2a,Options2b) :-
	Options1=[Options4|Options5],
	merge_lists1c(Options4,Options5,Options2a,Options2c),
	merge_lists1a(Options5,Options2c,Options2b).

merge_lists1c(_,[],Options,Options) :- !.
merge_lists1c(Options4,Options5,Options2a,Options2b) :-
	Options5=[Options5a|Options5b],
	merge_lists1b(Options4,Options5a,Options2a,Options2c),
	merge_lists1c(Options4,Options5b,Options2c,Options2b).

merge_lists1b([],[],Options,Options) :- !.
merge_lists1b(Options1,Options2,Options3a,Options3b) :-
	Options1=[Options4|Options5],
	Options2=[Options6|Options7],
%%	trace,
	merge_lists2(Options4,Options6,Options3a,Options3c),
%%writeln1(	merge_lists2(Options4,Options6,Options3a,Options3c)),
	merge_lists1b(Options5,Options7,Options3c,Options3b).

**/

/**
merge_lists1([],Options,Options) :- !.
merge_lists1(Options1,Options3a,Options3b) :-
	Options1=[Options4|Options5],
	%%Options2=[Options6|Options7],
%%	trace,
	merge_lists1b(Options4,Options1,[],Options3c),
	append(Options3a,Options3c,Options3d),
%%writeln1(	merge_lists2(Options4,Options6,Options3a,Options3c)),
	merge_lists1(Options5,Options3d,Options3b).

merge_lists1b([],Options,Options) :- !.
merge_lists1b(Options1,Options3a,Options3b) :-
	Options1=[Options4|Options5],
	%%Options2=[Options6|Options7],
%%	trace,
	merge_lists2(Options4,Options1,[],Options3c),
	append(Options3a,Options3c,Options3d),
%%writeln1(	merge_lists2(Options4,Options6,Options3a,Options3c)),
	merge_lists1b(Options5,Options3d,Options3b).

**/

/**

[debug]  ?- merge_lists2([1, "a", 2],[4, "a", 5],[[[1, "a", 2], [2, "b", 3], [3, "c",-]], [[4, "a", 5], [5, "d", 6], [6, "e",-]]],O).
O = [[[1, "a", 2], [2, "b", 3], [3, "c", -]], [[1, "a", 5], [5, "d", 6], [6, "e", -]]].

[debug]  ?- merge_lists2([2, "b",3],[5, "b", 6],[[[1, "a", 2], [2, "b", 3], [3, "c",-]], [[1, "a", 5], [5, "b", 6], [6, "e",-]]],O).
O = [[[1, "a", 2], [2, "b", 3], [3, "c", -]], [[1, "a", 2], [2, "b", 6], [6, "e", -]]].

remove [1, "a", 2],flatten
does reordering cause a bug?
() replace in place, redo each time changed

merge if no more than 1 parent of each node before it
remove chains of 1-children
flatten, sort at end

* strings must be same length

- same parents, etc in next level x whole thing

debug each pred

fore and post cut in shortening (no middle cut)
- if middle cut (where abd acd->ad ad), find minimum combos of intermediate letters between forks with no conflicting (not the same items in the same order/same place)
	- letter for letter x
	- a single new level x
	- cut only if necessary (leave alone) x
	- a single new letter v
	
	continually merge and shorten until returns the same
	
**/

/**
same_parents([N1,_A1,_N2],[N4,_A2,_N3],Options61) :-
	findall([B1,B2,N1],member([B1,B2,N1],Options61),C1),
	findall([B3,B4,N4],member([B3,B4,N4],Options61),C2),
	subtract(C2,C1,[]).
	%% and vv?
**/
/**
merge_lists2([N1,A1,_N2],Options2,Options61,Options9) :-
	Options2=[N4,A2,N3],
	(A1=A2->
	(findall(Options52,(%%member(Options61,Options6),
	((member([N4,A,N3],Options61),
	no_more_than_one_parent_of_each_node_before1([N4,A,N3],Options61),
	same_parents([N1,A1,_N21],[N4,A2,N3],Options61),
	delete(Options61,[N4,A,N3],Options5),
	append([[N1,A,N3]],Options5,Options52))->true;
	Options61=Options52)
	),[Options8]),
	writeln1(Options8),
%%trace,
%% merge back until forward fork with a predicate
%%trace,
	writeln1(	merge_back_until_forward_fork(1,N4,N1,Options8,[],Options9a)),merge_back_until_forward_fork(1,N4,N1,Options8,[],Options9a),
	sort(Options9a,Options9)
	%%Options8=Options9
	);
	Options61=Options9).
**/
	/**
merge_lists2([N1,A1,_N2],Options2,Options61,Options9) :-
	Options2=[N4,A2,N3],
	(A1=A2->
	(findall(Options52,(%member(Options61,Options6),
	((member([N4,A,N3],Options61),
	delete(Options61,[N4,A,N3],Options5),
	append([[N1,A,N3]],Options5,Options52))->true;
	Options61=Options52)
	),[Options8]),
	writeln(Options8),
%%trace,
	findall(Options7,(member(Options81,Options8),
	(
	(member([N41,A10,N4],Options81),
	delete(Options81,[N41,A10,N4],Options51),
	append([[N41,A10,N1]],Options51,Options7))->true;
	Options81=Options7
	)),Options9));
	Options61=Options9).	
	**/
%%no_more_than_one_parent_of_each_node_before1([1,_A,_N3],_Options61) :- !.
/**
no_more_than_one_parent_of_each_node_before1([N4,_A,_N3],Options61) :-
	%%member([_N2,_A1,N4],Options61),
	%%trace,
	findall([N4,_,N5],(member([N4,_,N5],Options61),N4=1),B),
	not(B=[]),%%->true;fail),%%B=[]),
	%%(B=[_]->true;fail),
	!.
no_more_than_one_parent_of_each_node_before1([N4,_A,_N3],Options61) :-
	%%member([N2,A1,N4],Options61),
	findall([N5,_,N4],(member([N5,_,N4],Options61)),[_]),%%,not(N2=N5)
	findall([N2,A1,N4],(member([N2,A1,N4],Options61),no_more_than_one_parent_of_each_node_before1([N2,A1,N4],Options61)),[_])
	,!.
	
	
get_c(Name2) :-
	c(N1),
	concat_list(["c",N1],Name1),
	atom_string(Name2,Name1),
	N2 is N1+1,
	retractall(c(_)),
 	assertz(c(N2)).

group_by_same_destination1(B,Options8,Options11,Options12) :-
	%%B=[[A1,A2,A3]|B2],
findall([A1,A2,A3,A4,A5],(member([A1,A2,A3],B),member([A3,A4,A5],Options8)),C1),
	sort(C1,C2),
	findall([[A1,A2,C],[C,A4,A5]],(member([A1,A2,A3,A4,A5],C2),
	get_c(C)),Options11a),
	maplist(append,[Options11a],[Options11]),
	
	findall([[A1,A2,A3],[A3,A4,A5]],(member([A1,A2,A3,A4,A5],C2)),Options12a),
	maplist(append,[Options12a],[Options12]).
	%%group_by_same_destination2(B1,Options8,[],Options12),
	
%%group_by_same_destination2(B1,Options8,Options12a,Options12) :-
	

%%merge_back_until_forward_fork(1,1,_,Options1,Options2,Options3) :- 
%%	append(Options1,Options2,Options3),
%%	!.
merge_back_until_forward_fork(_N0,N4,_N1,Options8,Options9,Options10) :-
	(findall([N41,A,N6],(member([N41,_A10,N4],Options8),
	(member([N41,A,N6],Options8),not(N6=N4))),B),
	length(B,L),L>1),
	group_by_same_destination1(B,Options8,Options11,Options12),
	%%append(Options8,Options9,Options10).
	subtract(Options8,Options12,Options13),
	maplist(append,[Options13,Options11,Options9],[Options10]).

merge_back_until_forward_fork(N0,N4,_N1,Options8,Options9,Options10) :-
	(findall([N41,_,N6],(member([N41,A10,N4],Options8),
	member([N41,_,N6],Options8),not(N6=N4)),[_])->
	(member([N41,A10,N4],Options8),
	%%trace,
	delete(Options8,[N41,A10,N4],Options51),
	append(Options51,[[N41,A10,N4]],Options7),
	merge_back_until_forward_fork(N0,N41,N4,Options7,Options9,Options10));
	%%Options9=Options10).
	append(Options8,Options9,Options10)).
	**/
%% put [-,*] in
/**
merge_back_until_forward_fork1(_,[],Options7,Options7,N41,N41) :- !.
merge_back_until_forward_fork1(N1,Options8,Options72,Options7,_N43,N42) :-
	Options8=[[N41,A10,N4]|Rest],
	delete(Options8,[N41,A10,N4],Options51),
	append(Options51,[[N41,A10,N1]],Options73),
	append(Options72,Options73,Options74),
	merge_back_until_forward_fork2(Rest,Options74,Options7,N41,N42).

merge_back_until_forward_fork2([],Options7,Options7,N41,N41) :- !.
merge_back_until_forward_fork2(_,_Options71,_Options72,_N41,_N42) :- fail.

ad
ac
bc

**/

remove_chains_of_one_child_a([],Options1,Options2,Options3) :- 
	append(Options1,Options2,Options3),!. %*?
remove_chains_of_one_child_a(N1,Options0,Options1,Options2) :- 
	N1=[[-,A1]|Ms],
	member([N,A1,[-,A]],Options0),
	append(Options1,[[N,A1,[-,A]]],Options21),
	remove_chains_of_one_child_a(Ms,Options21,[],Options2),!.

remove_chains_of_one_child_a(N1,Options1,Options2,
Options3) :-
	N1=[M1|Ms],
	findall(A,(member([M1,A,_N2],Options1)),A1),
	sort(A1,A11),
	length(A11,A11L),
	(A11L>1->Switch=left;Switch=right),
	remove_chains_of_one_child_a1(Switch,M1,A11,Options1,[],Options31,[],N21),
	append(Options2,Options31,Options32),
	append(Ms,N21,M21),
	sort(M21,M2),
	remove_chains_of_one_child_a(M2,Options32,[],Options3).

remove_chains_of_one_child_a1(_,_,[],Options1,Options2,Options3,N,N) :- 
	append(Options1,Options2,Options3),!. %*?
remove_chains_of_one_child_a1(Switch,N1,A1,Options1,Options2,Options3,_,NA7) :-
	A1=[A2|A3],
	findall([N1,A2,N2],(member([N1,A2,N2],Options1)),A6),

	remove_chains_of_one_child_a3(Switch,A6,Options1,[],Options4),
	findall(N2,(member([N1,A2,N2],Options4)),NA6),
	append(Options2,Options4,Options5),
	remove_chains_of_one_child_a1(Switch,N1,A3,Options5,[],Options3,NA6,NA7).
	
	


remove_chains_of_one_child_a3(_,[],Options1,Options2,Options3
) :- 
	append(Options1,Options2,Options3),!.
remove_chains_of_one_child_a3(Switch,A8,Options1,Options2,Options3) :-
%trace,
	A8=[[N0,A,N1]|A9],
	member([N0,A,N1],Options1), %% ** delete
	delete(Options1,[N0,A,N1],Options6),
	%trace,
%%writeln1(	remove_chains_of_one_children2(N1,N3,Options1,[],_Options4)),
	remove_chains_of_one_child_a4(N0,A,N3,Options1,[],Options41),
	Options41=[_|Options42],
	%writeln([options41,Options41]),
	
	subtract(Options6,Options42,Options6a),
	% * if N0=n3 there are a and b etc.
	% could add a state on to the start x
	%%append(Options4,[[N0,A,N3]],Options4a),
	%trace,
	member([_N01,A2,N3],Options1),
	%trace,
	(Switch=left->[[N0,A,N3]]=Options4a;[[N0,A2,N3]]=Options4a),

	%[[N0,A2,N3]]=Options4a,
	%delete(Options6,[_N0a1,A2,N3],Options6a),
	append(Options2,Options4a,Options5),
	%remove_chains_of_one_children1(N1,Options6a,Options5,Options3).
	
		remove_chains_of_one_child_a3(Switch,A9,Options6a,Options5,Options31),
		(N3=[-,_]->Options31=Options3;
		remove_chains_of_one_child_a([N3],Options31,[],Options3))
		%,notrace
		.
	
remove_chains_of_one_child_a4(N1,A,N3,Options1,Options2,Options3) :-
%trace,
	(N1=[-,_]->(N3=N1,Options2=Options3);
	(member([N1,A,N2],Options1),member([N2,_,N22],Options1),member([N2,_,N23],Options1),not(N22=N23),N3=N2,append(Options2,[[N1,A,N2]],Options3))),!.
remove_chains_of_one_child_a4(N1,A1,N3,Options1,Options2,Options3) :-
	member([N1,A2,N2],Options1),
	append(Options2,[[N1,A2,N2]],Options31),
	remove_chains_of_one_child_a5(N2,A1,N3,Options1,Options31,Options3).

remove_chains_of_one_child_a5(N1,_A1,N3,Options1,Options2,Options3) :-
%trace,
	(N1=[-,_]->(N3=N1,Options2=Options3);
	(member([N1,A,N2],Options1),member([N2,_,N22],Options1),member([N2,_,N23],Options1),not(N22=N23),N3=N2,append(Options2,[[N1,A,N2]],Options3))),!.
remove_chains_of_one_child_a5(N1,A1,N3,Options1,Options2,Options3) :-
	member([N1,A2,N2],Options1),
	append(Options2,[[N1,A2,N2]],Options31),
	remove_chains_of_one_child_a5(N2,A1,N3,Options1,Options31,Options3).
	
	/**
remove_chains_of_one_children1([-,_],Options1,Options2,Options3) :-
%%trace,
	append(Options1,Options2,Options3),!.
remove_chains_of_one_children1(N0,Options1,Options2,Options3) :-
	not(member([N0,_A,_N1],Options1)),
	append(Options1,Options2,Options3),!.
**/

/**
remove_chains_of_one_children0(N3) :-
Options1=[[1,"a",2],[2,"b",[-,"ab"]],[1,"c",4],[4,"d",[-,"cd"]]],
trace,
	remove_chains_of_one_children2(1,N3,Options1,[],_Options41).
	**/
	
/**
remove_chains_of_one_children1(N0,Options1,Options2,Options3) :-

%trace,
	%%remove_chains_of_one_children2(N0,NM1,Options1,[],_Options413),
	%%((NM1=[-,_]->true;(member([-,String],Options1),string_length(String,NM1)))->fail;true),


	%trace,
	findall([N0,A,N1],(member([N0,A,N1],Options1),
	remove_chains_of_one_children2(N1,N3,Options1,[],_Options41)),NN2),

	subtract(Options1,NN2,Options6),

	findall([N0,A,N1,A4,N3],(member([N0,A,N1],Options1),
	remove_chains_of_one_children2(N1,N3,Options1,[],_Options412),
	member([_N5,A4,N3],Options1)),NN3),

	%trace,
	findall(A4,(member([N0,A,N1,A4,N3],NN3)),NN5),
	sort(NN5,NN51),
	findall([N0,A412,N3],(member(A41,NN51),member([N0,A412,N1,A41,N3],NN3)),NN6),
writeln1(NN6),

%trace,
	length(NN6,NN6L),
	((NN6L>1,NN6=[[NN6M1,NN6M2,_]|NN6R])->((member([NN6M1,NN6M2,_],NN6R),delete(NN6R,[NN6M1,NN6M2,_],NN62))->
	NN61=NN62;NN61=NN6
	);NN61=NN6),


%trace,
	findall(A,(member([N0,A,N1,A4,N3],NN3)),NN7),
	sort(NN7,NN71),
	findall([N0,A12,N3],(member(A1,NN71),member([N0,A1,N1,A12,N3],NN3)),NN8),
writeln1(NN8),

%trace,

	length(NN8,NN8L),
	((NN8L>1,NN8=[[NN8M1,NN8M2,_]|NN8R])->((member([NN8M1,NN8M2,_],NN8R),delete(NN8R,[NN8M1,NN8M2,_],NN82))->
	NN81=NN82;NN81=NN8
	);NN81=NN8),
%trace,
append(NN61,NN81,Options4a),
%findall(_,(member(Options4c,Options4b),
%%writeln1(remove_chains_of_one_children2(N1,N3,Options1,[],_Options4)),
	%%append(Options4,[[N0,A,N3]],Options4a),
	
	append(Options2,Options4a,NNA),

%trace,	
	
	findall(NND,(member([_NNB,_NNC,NND],NNA)),NNE),sort(NNE,NNE1),
	findall(NNI,(member(NNE2,NNE1),findall([NNF,NNG,NNE2],(member([NNF,NNG,NNE2],NNA),!),[NNI])),NNH),
	NNH=Options5,
	
	remove_chains_of_one_children1(N0,Options6,Options5,Options3).
	
**/
/**
remove_chains_of_one_children1(N0,Options1,Options2,Options3) :-
%trace,
	member([N0,A,N1],Options1),
	delete(Options1,[N0,A,N1],Options6),
	%trace,
%%writeln1(	remove_chains_of_one_children2(N1,N3,Options1,[],_Options4)),
	remove_chains_of_one_children2(N0,N3,Options1,[],_Options41),
	% * if N0=n3 there are a and b etc.
	% could add a state on to the start x
	%%append(Options4,[[N0,A,N3]],Options4a),
	%trace,
	member([_N01,A2,N3],Options1),
	%trace,
	[[N0,A2,N3]]=Options4a,
	delete(Options6,[_N0a1,A2,N3],Options6a),
	append(Options2,Options4a,Options5),
	remove_chains_of_one_children1(N1,Options6a,Options5,Options3).
**/
%remove_chains_of_one_children2([-,A],[-,A],Options1,Options2,Options3) :-
%	append(Options1,Options2,Options3),!.

%remove_chains_of_one_children2(N1,N1,Options1,_Options2,_Options3) :-
	%(member([N1,_,N22],Options1),member([N1,_,N23],Options1),not(N22=N23)),!.
	/**
remove_chains_of_one_children2(N1,N3,Options1,_Options2,_Options3) :-
	(N1=[-,_]->N3=N1;
	(member([N1,_A,N2],Options1),member([N2,_,N22],Options1),member([N2,_,N23],Options1),not(N22=N23),N3=N2)),!.
remove_chains_of_one_children2(N1,N3,Options1,_Options2,_Options3) :-
	member([N1,_,N2],Options1),
	remove_chains_of_one_children2(N2,N3,Options1,_Options21,_Options31).
	**/
/**
remove_chains_of_one_children2(N1,N3,Options1,Options2,Options3) :-
	findall([N1,A,N2],member([N1,A,N2],Options1),Options4),
	(not(Options4=[_])->
	
	%%remove_chains_of_one_children3(Options2,Options4,Options3)
	
	(%%append(Options2,Options4,Options5),
	Options2=Options5,

%%	(member([N2,_,N22],Options1),member([N2,_,N23],Options1),not(N22=N23)),

remove_chains_of_one_children11(Options4,Options5,Options3))),
Options4=[[N3,_,_]|_].
	%remove_chains_of_one_children1(N2,Options4,Options5,Options3),
	%writeln1([options4,Options4]),
	%Options4=[[N3,_,_]|_]
	%)
	%;fail).%%,!.
	**/
	/**
remove_chains_of_one_children2(N1,N3,Options1,Options2,Options3) :-
	findall([N1,A,N2],member([N1,A,N2],Options1),[_]),
	member([N1,A,N2],Options1),
	delete(Options1,[N1,A,N2],Options4),
writeln1(remove_chains_of_one_children2(N1,N3,Options1,Options2,Options3)),
	%(member([N2,_,N22],Options1),member([N2,_,N23],Options1),not(N22=N23)),	
	remove_chains_of_one_children2(N2,N3,Options4,Options2,Options3).
	
remove_chains_of_one_children11([],Options,Options) :- !.
remove_chains_of_one_children11(Options4,Options5,Options3) :-
	Options4=[[_,_,N2]|N2s],
	remove_chains_of_one_children1(N2,Options4,Options5,Options41),
	remove_chains_of_one_children11(N2s,Options41,Options3).
**/
/**
remove_chains_of_one_children3(Options2,Options4,Options3) :-
	member(B,
	(append(Options2,[[N1,A,N2]],Options5),
	remove_chains_of_one_children1(N2,Options4,Options5,Options3
**/

equals_empty_list([]).

get_item_n(Exposition,Number1,Item) :-
	Number2 is Number1-1,
	length(List,Number2),
	append(List,[Item|_],Exposition).
