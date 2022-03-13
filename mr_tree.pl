%% mr_tree.pl

findbest(R,R) :-!.
findbest2(R,Item):-
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Item]|_Rest].
	
	concat_list2A(A1,B):-
	A1=[A|List],
	concat_list2A(A,List,B),!.

concat_list2A(A,[],A):-!.
concat_list2A(A,List,B) :-
	List=[Item|Items],
	string_concat(A,Item,C),
	concat_list2A(C,Items,B).


mind_read(Item,[Item]) :- !.
mind_read(Item,List0) :-

(lists_of_same_length1(List0)->mind_read_a(Item,List0); 
%% segment decision trees

mind_read_b(Item,List0)). 
%% 1 decision tree


mind_read_a(Item,List0) :-

/**
	findall(L,(member(Item,List0),string_length(Item,L)),Ls1),
	sort(Ls1,Ls2),
	reverse(Ls2,Ls3),
	Ls3=[Maximum_length|_],
	numbers(Maximum_length,1,[],Numbers1),
**/

	mind_read_a_1(List0,[],Item).

%mind_read_a_1([List0],Item1_a,Item1_a2) :-
%	append(Item1_a,[List0],Item1_a2),!.
mind_read_a_1(List0,Item1_a,Item1_a2) :-
	%List0=[List0_1|_Rest],
	(maplist(equals_empty_list,List0)->(%trace,%append(Item1_a,[Item],Item1_a2));
	Item1_a=Item1_a2);
(
	%trace,	
findall(Item2_a,(member(List0_1,List0),get_item_n(List0_1,1,Item2_a)),Item2_a1),
	sort(Item2_a1,Item2_a2),

	findall(D1,(member(D2,Item2_a2),
	term_to_atom(D2,D3),string_atom(D1,D3)),List1),
%trace,
	
	%List1=A,
	findall(B,(member(C,List1),string_concat(C," 01",B)),List2),
	findall(B,(member(C,List2),(number(C)->number_string(C,B)->true;((atom(C)->atom_string(C,B))->true;(string(C),C=B)))),List3),
	
	%trace,
	
	minimise_strings1(List3,List4,Map),

%writeln1(minimise_strings1(List3,List4,Map)),	
	% findall(B,(member(C,List13),string_concat(C," 01",B)),List),

		%notrace,
		%trace,
		%writeln1(make_mind_reading_tree4(List,Tree)),
	make_mind_reading_tree4(List4,Tree),
		%writeln1(make_mind_reading_tree4-here1(List,Tree)),

%writeln1(mind_read2(1,Tree,Item1)),
	mind_read2(1,Tree,Item1),
writeln1(mind_read2(1,Tree,Item1)),
writeln(""),
	%trace,
	%string_concat(Item3," 01",Item1),
	find_mapped_item(Item1,Item2,Map),
	term_to_atom(Item,Item2),
	
	(findall(Rest1,(member(Item1_b,List0),%get_item_b(Item1_b,Number,Item1_b1),%Number2 is Number+1,get_item_b(Item1_b,Number2,Item1_b2)
	Item1_b=[Item|Rest1]),Item1_b2),
	append(Item1_a,[Item],Item1_a3),
	mind_read_a_1(Item1_b2,Item1_a3,Item1_a2)))).

mind_read_b(Item,List0) :-
	findall(D1,(member(D2,List0),term_to_atom(D2,D3),string_atom(D1,D3)),List1),
%trace,
	
	%List1=A,
	findall(B,(member(C,List1),string_concat(C," 01",B)),List2),
	findall(B,(member(C,List2),(number(C)->number_string(C,B)->true;((atom(C)->atom_string(C,B))->true;(string(C),C=B)))),List3),
	
	%trace,
	
	minimise_strings1(List3,List4,Map),

%writeln1(minimise_strings1(List3,List4,Map)),	
	% findall(B,(member(C,List13),string_concat(C," 01",B)),List),

		%notrace,
		%trace,
		%writeln1(make_mind_reading_tree4(List,Tree)),
	make_mind_reading_tree4(List4,Tree),
		%writeln1(make_mind_reading_tree4-here1(List,Tree)),

%writeln1(mind_read2(1,Tree,Item1)),
	mind_read2(1,Tree,Item1),
writeln1(mind_read2(1,Tree,Item1)),
writeln(""),
	%trace,
	%string_concat(Item3," 01",Item1),
	find_mapped_item(Item1,Item2,Map),
	term_to_atom(Item,Item2).

mind_read2(N1,Tree1,Item1) :-
	findall(Option,member([N1,Option,N2],Tree1),Options),
	findall([N1,Option,N2],member([N1,Option,N2],Tree1),Options2),
	%subtract(Tree1,Options,Tree2),
	mind_read10(Item2,Options),
	mind_read3(N1,Options2,Options,Tree1,Item2,Item1).


numbers(N2,N1,Numbers,Numbers) :-
	N2 is N1-1,!.
numbers(N2,N1,Numbers1,Numbers2) :-
	N3 is N1+1,
	append(Numbers1,[N1],Numbers3),
	numbers(N2,N3,Numbers3,Numbers2).
	
mind_read3(N1,_,_,Tree1,Item2,Item1) :-
	member([N1,Item2,[-,Item1]],Tree1),!.
mind_read3(N1,Options2,_Options,Tree1,Item2,Item1) :-
%trace,
	%subtract2(Tree1,Options,[],Tree2),
	member([N1,Item2,N2],Options2),
	mind_read2(N2,Tree1,Item1).
	
mind_read10("",[]) :- !.
mind_read10(Item,[Item]) :-
	writeln1([item,Item]),!.
mind_read10(Item,List) :-
writeln1([list,List]),
%trace,
%%catch(
	(trialy2(List,R1),
	findbest(R1,Item),
	writeln1([item,Item]))
   %_,
	%mind_read10(Item,List)
	%)
	,
!.
	%%random_member(Item,List),!.
	
mind_read100(Item,List) :-
	length(List,L),
	Trials is 3*L,
	trialy22(List,Trials,[],R1),
	findbest(R1,Item),!.

mind_read_instruments(Instrument,_) :-
	instruments_a(Instruments),
		%notrace,
		%writeln1(mind_read2(1,Instruments,Item1)),

	mind_read2(1,Instruments,Item1),%->trace;trace),
			%writeln1(mind_read2-here3(1,Instruments,Item1)),

	%trace,
	string_concat(Item2," 01",Item1),
	term_to_atom(Instrument,Item2).

trialy2([],R) :-
	R=[[_,['C']]].
	%%writeln([[],in,trialy2]),abort.
trialy2(List,R) :-
%%writeln([list,List]),
%%notrace,
	length(List,Length),
	((Length=<9->
		findr4(R4),
		number_string(R4,R4A),
		formr5([R4A],9,Length,R5),
		findr(R5,List,R));
	(Length=<99->
		findr4(R41),
		findr4(R42),
		formr5([R41,R42],99,Length,R5),
		findr(R5,List,R));
	(Length=<999->
		findr4(R41),
		findr4(R42),
		findr4(R43),
		formr5([R41,R42,R43],999,Length,R5),
		findr(R5,List,R));
	fail),
	%%writeln([r,R]),trace.
	true.

findr4(R4) :-
		List1=[0,1,2,3,4,5,6,7,8,9],
		Trials is 30,
%catch(
	(trialy22(List1,Trials,[],R1),
	findbest2(R1,R4)
	%writeln1([item,Item])
	)
   %_,
	%findr4(R4)
	%)
	.
		%%number_string(R3,R2),
formr5(RList,Upper,Length,R5) :-
		%%findall(D,(member(C,RList),floor(C,D)),RList2),
		concat_list2A(RList,R5A),
		number_string(R5B,R5A),
		R51 is floor((R5B/Upper)*Length),
		(R5B=Upper->R5 is R51-1;R5=R51).
findr(R4,List,R) :-
		%%floor(R4,R4A),		
		length(A,R4),
		append(A,[R|_],List).

	%%random_member(A,List),
	%%R=[[_,A]].
	
	/**
	length(List,L),
	Trials is L*3,
	trialy22(List,Trials,[],R).**/

trialy22([],_,R,R) :- !.
trialy22(List,Trials,RA,RB) :-
	List=[Item|Items],
	trialy21(Item,Trials,R1),
	append(RA,[R1],RC),
	trialy22(Items,Trials,RC,RB),!.

trialy21(Label,Trials,RA) :-
	trialy3(Trials,[],R),
	aggregate_all(count, member(true,R), Count),
	RA=[Count,Label].

trialy3(0,R,R) :-!.
trialy3(Trials1,RA,RB) :-
	trialy1(R1),
	append(RA,[R1],RC),
	Trials2 is Trials1-1,
	trialy3(Trials2,RC,RB),!.
	
%% try other nouns
trialy1(R1) :-
	%%control11(A1),
	trial0(A22), %% Control
	sum(A22,0,S22),
	mean(S22,A1),
	trial0(A21), %% Test 1
	sum(A21,0,S02),
	mean(S02,A2),
	(A1>A2->R1=true;R1=fail).

trial0(S3) :- N is 10, 
catch(
	(trial1(N,[],S),trial01(S,S3)),
   _,
	trial0(S3)).
trial01(S1,S3) :-
	sort(S1,S),
	%%midpoint(S,MP),
	halves(S,H1,H2),
	midpoint(H1,Q1),
	midpoint(H2,Q3),
	IQR is Q3-Q1,
	sum(S,0,S02),
	mean(S02,Mean),
	furthestfrommean(S,Mean,V),
	D1 is 1.5*IQR,
	D2 is V-Mean,
	(D2>D1->(delete(S,V,S2),trial01(S2,S3));S=S3).
	
trial1(0,A,A) :- !.
trial1(N,A,B) :- mindreadtest(S), append(A,[S],A2),
	N1 is N-1,trial1(N1,A2,B).
	
midpoint(S,MP) :-
	length(S,L),
	A is mod(L,2),
	(A is 0->
		(M1 is L/2, M2 is M1+1,N1 is M1-1,N2 is M2-1,length(N11,N1),length(N21,N2),append(N11,[N12|_Rest1],S),append(N21,[N22|_Rest2],S),MP is (N12+N22)/2)
	;
		(L2 is L+1, M1 is L2/2, N1 is M1-1,length(N11,N1),append(N11,[MP|_Rest],S))).

halves(S,H1,H2) :-
	length(S,L),
	A is mod(L,2),
	(A is 0->
		(M1 is L/2,length(H1,M1),append(H1,H2,S))
	;
		(L2 is L-1,M1 is L2/2,length(H1,M1),append(H1,[_|H2],S))).

sum([],S,S):-!.
sum(S0,S1,S2) :-
	S0=[S3|S4],
	S5 is S1+S3,
	sum(S4,S5,S2).
	
mean(Sum,Mean) :-
	Mean is Sum/2.

furthestfrommean(S,Mean,V) :-
	absdiffmean(S,Mean,[],D),
	sort(D,D1),
	reverse(D1,[[_,V]|_Rest]).

absdiffmean([],_M,D,D) :- !.
absdiffmean(S,M,D1,D2) :-
	S=[S1|S2],
	S3 is abs(S1-M),
	append(D1,[[S3,S1]],D3),
	absdiffmean(S2,M,D3,D2).

mindreadtest(Sec) :-
	%% 250 br for characters to be br out with 10 br each from person to me - do when initial 250 br test done and doing 10 br test
	%%comment(fiftyastest),
	%%random(X),X1 is 10*X, X2 is floor(X1), (X2=<2 -> (
	%%texttobr,writeln(['true test']), %%); %% use breasonings breasoned out by computer for not by me, for job medicine for "me", at last time point
	%%true), %% leave last time point blank
	%%**texttobr2(640);true),%% make an A to detect reaction to gracious giving or blame of in following
	get_time(TimeStamp1),
	%%phrase_from_file(string(_String), 'file.txt'),
	texttobr2(2), %% 100 As for answer (must be br before this on same day)
	%% is gracious giving or blame
	get_time(TimeStamp2),
	%%comment(turnoffas),
   Sec is TimeStamp2 - TimeStamp1.

lists_of_same_length1(List0) :-
	list1(List0,_,_),
	List0=[Item1|_],
	%term_to_atom(Item1,Item2),
	(list1(Item1,_,_)->Item2=Item1;fail),%[Item1]=Item2),
	length(Item2,Item2_l),
	lists_of_same_length2(List0,Item2_l).

lists_of_same_length2([],_Item2_l) :- !.
lists_of_same_length2(List0,Item2_l) :-
	List0=[Item1|Rest],
	(list1(Item1,_,_)->Item2=Item1;fail),%[Item1]=Item2),
	%term_to_atom(Item1,Item2),	
	length(Item2,Item2_l),
	lists_of_same_length2(Rest,Item2_l).

minimise_strings1([List0],[List0],[[List0,List0]]) :- 
	string(List0),!.
minimise_strings1(List0,A,Map) :-
	sort(List0,List1),
	findall(L,(member(Item,List1),string_length(Item,L)),Ls1),
	sort(Ls1,Ls2),
	reverse(Ls2,Ls3),
	Ls3=[Maximum_length|_],
	numbers(Maximum_length,1,[],Numbers1),
	minimise_strings11(Numbers1,_Numbers2,List1,List2,First_part),
	string_length(First_part,First_part_l),
	Maximum_length2 is Maximum_length-First_part_l+1,
	numbers(Maximum_length2,1,[],Numbers3),
	minimise_strings2(Numbers3,List2,First_part,A,Map).

minimise_strings11(Numbers,Numbers,[],[],_) :- !.
minimise_strings11(Numbers1,Numbers2,List1,List2,First_part) :-
	Numbers1=[Number|Numbers3],
	findall(Item2,(member(Item1,List1),string_concat(Item2,_,Item1),
	string_length(Item2,Number)),Item3),
	Item3=[First_part2|_],
	string_concat(First_part1,Char,First_part2),
	string_length(Char,1),
	sort(Item3,Item3a),
	length(Item3,Item3_l),
	length(List1,List1_l),
	(Item3_l=List1_l->
	(Number2 is Number-1,
	findall(Item4,(member(Item1,List1),string_concat(Item2,Item4,Item1),
	string_length(Item2,Number2)),Item4a),
	(length(Item3a,1)->
	minimise_strings11(Numbers3,Numbers2,List1,List2,First_part);
	(Numbers2=Numbers1,List2=Item4a,First_part=First_part1)));
	(Numbers2=Numbers1,List2=List1,First_part=First_part1)).


minimise_strings2([],_List1,_,_A,_Map) :- !.
minimise_strings2(Numbers1,List1,First_part,A1,Map1) :-
	Numbers1=[Number|Numbers2],
	findall(Item3a,(member(Item1,List1),string_concat(Item2,_,Item1),
	string_length(Item2,Number),string_concat(Item2," 01",Item3a)),Item3),
	sort(Item3,Item31),
%trace,
findall([Item3a,Item1a],(member(Item1,List1),string_concat(Item2,_,Item1),
	string_length(Item2,Number),string_concat(Item2," 01",Item3a),string_concat(First_part,Item1,Item1a)),Item4),
	length(Item31,Length1),
	length(Item3,Length2),
	(Length1=Length2->(A1=Item3,Map1=Item4);
	minimise_strings2(Numbers2,List1,First_part,A1,Map1)).

find_mapped_item(Item3,Item2,Map) :-
	member([Item3,Item4],Map),
	string_concat(Item2," 01",Item4).

too_long1(List4) :-
	too_long2(List4,0,N),
	N>=250.

too_long2([],N,N) :- !.
too_long2(List4,N1,N2) :-
	List4=[Item|Rest],
	string_length(Item,Length),
	N3 is N1+Length,
	too_long2(Rest,N3,N2).

