:- dynamic c/1.

%%% make_mind_reading_tree4(["abc","ade"],A).

make_mind_reading_tree4(Options0,Options3) :-
  	retractall(c(_)),
 	assertz(c(1)),

	sort(Options0,Options1),
	string_to_list1(Options1,1,_,[],Options2),
	maplist(append,[Options2],[Options2a]),
	merge_lists1a(Options2,Options2a,Options3a),
	%%trace,
writeln1(remove_chains_of_one_children1(1,Options3a,[],Options3b)),
	remove_chains_of_one_children1(1,Options3a,[],Options3b),
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

**/

same_parents([N1,_A1,_N2],[N4,_A2,_N3],Options61) :-
	findall([B1,B2,N1],member([B1,B2,N1],Options61),C1),
	findall([B3,B4,N4],member([B3,B4,N4],Options61),C2),
	subtract(C2,C1,[]).
	%% and vv?


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
	/**
	findall(Options7,(member(Options81,Options8),
	(
	(member([N41,A10,N4],Options81),
	delete(Options81,[N41,A10,N4],Options51),
	append([[N41,A10,N1]],Options51,Options7))->true;
	Options81=Options7
	)),Options9)
	**/
	);
	Options61=Options9).
	
%%no_more_than_one_parent_of_each_node_before1([1,_A,_N3],_Options61) :- !.
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

**/

remove_chains_of_one_children1([-,_],Options1,Options2,Options3) :-
%%trace,
	append(Options1,Options2,Options3),!.
remove_chains_of_one_children1(N0,Options1,Options,Options) :-
	not(member([N0,_A,_N1],Options1)).
remove_chains_of_one_children1(N0,Options1,Options2,Options3) :-
	member([N0,A,N1],Options1),
	delete(Options1,[N0,A,N1],Options6),
%%writeln1(	remove_chains_of_one_children2(N1,N3,Options1,[],_Options4)),
	remove_chains_of_one_children2(N1,N3,Options1,[],_Options41),
	%%append(Options4,[[N0,A,N3]],Options4a),
	member([_N01,A2,N3],Options1),
	[[N0,A2,N3]]=Options4a,
	append(Options2,Options4a,Options5),
	remove_chains_of_one_children1(N0,Options6,Options5,Options3).

remove_chains_of_one_children2([-,A],[-,A],Options1,Options2,Options3) :-
	append(Options1,Options2,Options3),!.
remove_chains_of_one_children2(N1,N3,Options1,Options2,Options3) :-
	findall([N1,A,N2],member([N1,A,N2],Options1),Options4),
	(not(Options4=[_])->
	
	%%remove_chains_of_one_children3(Options2,Options4,Options3)
	
	(%%append(Options2,Options4,Options5),
	Options2=Options5,

	(member([N2,_,N22],Options1),member([N2,_,N23],Options1),not(N22=N23)),

	remove_chains_of_one_children1(N2,Options4,Options5,Options3),
	writeln1([options4,Options4]),
	Options4=[[N3,_,_]|_]
	)
	;fail).%%,!.
remove_chains_of_one_children2(N1,N3,Options1,Options2,Options3) :-
	findall([N1,A,N2],member([N1,A,N2],Options1),[_]),
	member([N1,A,N2],Options1),
	delete(Options1,[N1,A,N2],Options4),
	remove_chains_of_one_children2(N2,N3,Options4,Options2,Options3).
	
/**
remove_chains_of_one_children3(Options2,Options4,Options3) :-
	member(B,
	(append(Options2,[[N1,A,N2]],Options5),
	remove_chains_of_one_children1(N2,Options4,Options5,Options3
**/