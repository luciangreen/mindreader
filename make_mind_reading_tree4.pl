%%% make_mind_reading_tree4(["abc","ade"],A).

make_mind_reading_tree4(Options0,Options3) :-
	sort(Options0,Options1),
	string_to_list1(Options1,1,_,[],Options2),
	merge_lists1a(Options2,Options2,Options3).
	
string_to_list1([],N,N,Options,Options) :- !.
string_to_list1(Options1,N1,N2,Options2a,Options2b) :-
	Options1=[B|Rest],
	%%findall(C,(member(B,Options1),
	string_to_list2(B,N1,N3,Options2a,Options2c),%%),Options2).
	%%trace,
	[Options2c]=Options2d,
%%trace,
	string_to_list1(Rest,N3,N2,[],Options2e),
	append(Options2d,Options2e,Options2b).

string_to_list2(B,N1,N2,A1,A2) :- 
	string_concat(D,"",B),
	string_length(D,1),
	append(A1,[[N1,D,-]],A2),
	N2 is N1 + 1,!.
string_to_list2(A,N1,N2,B,C) :-
	string_concat(D,E,A),
	string_length(D,1),
	N3 is N1 + 1,
	append(B,[[N1,D,N3]],F),
	%%maplist(append,[[B,D]],[F]),
	string_to_list2(E,N3,N2,F,C).

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
	merge_lists2(Options4,Options6,Options3a,Options3c),
	merge_lists1b(Options5,Options7,Options3c,Options3b).

/**

[debug]  ?- merge_lists2([1, "a", 2],[4, "a", 5],[[[1, "a", 2], [2, "b", 3], [3, "c",-]], [[4, "a", 5], [5, "d", 6], [6, "e",-]]],O).
O = [[[1, "a", 2], [2, "b", 3], [3, "c", -]], [[1, "a", 5], [5, "d", 6], [6, "e", -]]].

[debug]  ?- merge_lists2([2, "b",3],[5, "b", 6],[[[1, "a", 2], [2, "b", 3], [3, "c",-]], [[1, "a", 5], [5, "b", 6], [6, "e",-]]],O).
O = [[[1, "a", 2], [2, "b", 3], [3, "c", -]], [[1, "a", 2], [2, "b", 6], [6, "e", -]]].

remove [1, "a", 2],flatten
does reordering cause a bug?

**/

merge_lists2([N1,A1,_N2],Options2,Options6,Options9) :-
	Options2=[N4,A2,N3],
	(A1=A2->
	(findall(Options52,(member(Options61,Options6),
	((member([N4,A,N3],Options61),
	delete(Options61,[N4,A,N3],Options5),
	append([[N1,A,N3]],Options5,Options52))->true;
	Options61=Options52)
	),Options8),
	writeln(Options8),
%%trace,
	findall(Options7,(member(Options81,Options8),
	(
	(member([N41,A10,N4],Options81),
	delete(Options81,[N41,A10,N4],Options51),
	append([[N41,A10,N1]],Options51,Options7))->true;
	Options81=Options7
	)),Options9));
	Options6=Options9).
	
