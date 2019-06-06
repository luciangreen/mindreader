%% mindreadtestobj-12scrn.pl

%% N is 2*4*5,texttobr2(N). before for rb, 100 As for imagery etc appearing clearly to and from computer and with both with rb, itself, graciously give or blame, radio button for graciously give or blame, by 5 objects
%% then texttobr2(40).to turn  off these with 250s before start - also breason out and dot on objects before line above and breason out and dot on when recognising and saying object (with all objects having different breasonings)

%% to recognise, think of stream of consciousness breasonings, the appearance of an object, words appearing and tricky appearances that mean something else

%% teach subjects these skills telepathically one by one

%% Before using, think 2 radio buttons put on recordings put through with prayer, nut and bolt, quantum box prayer, .01 .01 .005 .01 .01 .005

%% The algorithm has at (different x) times projected and identified my thought correctly but many of the figures are too similar

%% br done on 25 5 19 for all time

%% ideas: goats play board games against each other, they learn br, they ask questions and request games, the computer runs in real time and runs one game at a time, so they need to be scheduled.  Also tournaments of br tests, maths, computer science, and games. Humanities texts come later.

%% Sometimes I had the feeling of a quick representation taken from me before I could speak, people "talking for me" (in any case, a false reading) and other options appearing above mine, and sometimes breasonings I said "stickily" matching a different option from what I meant registered as the option

%% The removal of interference with the interquartile range, increase to pointer to 100 done up As for projection and reading and breasoning preparation steps including As given to and doing breasoning out the answer led to better results

%%use_module(library(pio)).

:- use_module(library(date)).
:- include('texttobr2qb').

daysbspeoplearmy:-
	daysbspeoplearmy(45),
	daysbspeoplearmy(2). %% Give to people with graciously give or blame, radio button for graciously give or blame

daysbspeoplearmy(0):-!.
daysbspeoplearmy(N1):-
	texttobr2,N2 is N1-1,daysbspeoplearmy(N2).

control1:-
	retractall(control11(_)),
	writeln("Think of nothing for the next second"),
	sleep(1),
	trial0(A1), %% control1
	sleep(5),
	sum(A1,0,S02),
	mean(S02,A2),
   	assertz(control11(A2)).

%%sectest0 :-
%%repeat,sectest,sectest0.
sectest:-
	control1,
	writeln(["Computer will think of one of following thoughts in 5 seconds\n", "seed","water","dam","redblackduck","lorelle"]),
	sleep(4),
	writeln(["Now"]),
	sleep(1),
	random_member(A,["seed","water","dam","redblackduck","lorelle"]),
	texttobr2(2), %% for 100 As for screen to display black border
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["Think of an object the computer thought of in 1 second\n", "seed","water","dam","redblackduck","lorelle"]),
	sleep(1),
	%% Test thought here.
	%%writeln(["Now"]),
	%%get_time(TS),stamp_date_time(TS,T,local),writeln([dateandtime,T]),
	trialy2("seed",R1),
	trialy2("water",R2),
	trialy2("dam",R3),
	trialy2("redblackduck",R4),
	trialy2("lorelle",R5),
	trialy2("adrian",R6),
	/**trialy2("g",R7),
	trialy2("h",R8),
	trialy2("i",R9),
	trialy2("j",R10),
	trialy2("k",R11),
	trialy2("l",R12),
	trialy2("m",R13),
	trialy2("n",R14),
	trialy2("o",R15),
	trialy2("p",R16),
	trialy2("q",R17),
	trialy2("r",R18),
	trialy2("s",R19),
	trialy2("t",R20),
	trialy2("u",R21),
	trialy2("v",R22),
	trialy2("w",R23),
	trialy2("x",R24),
	trialy2("y",R25),
	trialy2("z",R26),
	trialy2(" ",R27),**/
	R=[R1,R2,R3,R4,R5,R6],%%,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27],
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Item]|_Rest],writeln(["Computer thought",A,"You thought",Item,"\nYou thought with first most likely\n",RB]).
	%%read_string(user_input,1,_).

trialy2(Label,RA) :-
	%%writeln([testing,Label]),
	trialy1(R1),
	trialy1(R2),
	trialy1(R3),
	trialy1(R4),
	trialy1(R5),
	trialy1(R6),
	trialy1(R7),
	trialy1(R8),
	trialy1(R9),
	trialy1(R10),
	trialy1(R11),
	trialy1(R12),
	trialy1(R13),
	trialy1(R14),
	trialy1(R15),
	R=[R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15],
	%%(member(true,R)->(
	aggregate_all(count, member(true,R), Count),
	RA=[Count,Label].%%,writeln([Label,Count,"/10"]));true).

trialy1(R1) :-
	%%control11(A1),
	trial0(A22), %% Control
	sum(A22,0,S22),
	mean(S22,A1),
	trial0(A21), %% Test 1
	sum(A21,0,S02),
	mean(S02,A2),
	(A1>A2->R1=true;R1=fail).

trial0(S3) :- N is 10, trial1(N,[],S),trial01(S,S3).
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

/**string(String) --> list(String).

list([]) --> [].
list([L|Ls]) --> [L], list(Ls).

comment(fiftyastest).
comment(turnoffas).
**/