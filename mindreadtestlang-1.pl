%% mind read test

%% Make files different for different tests

/**
1. Breason out 250 br A - as receiver/idea	
2. Time this for A for the topic breasoned out and not breasoned out at random intervals for an interval of time (not to do with the random intervals), person to me
3. Does it take considerably longer for detected As? - calculate median of mostly hopefully false trials and differences from it x labelled graph first - do 10 trials over 10 minutes with 3 hopefully successful attempts that are labelled

In addition to mindreadtestobj 250s, do 250 bos for front, behind, above and below, protection and off for each one

every 0.1 s wuc/mnws? New Recording 6.m4a "...lo I'm Lucian"

x: (too difficult because letters are not words - focus on objects)

- combine with objects x make interval much shorter, repeat

**/

%%use_module(library(pio)).

:- use_module(library(date)).
:- include('texttobr2qb').

sectest0 :-
repeat,sectest,sectest0.
sectest:-
	get_time(TS),stamp_date_time(TS,T,local),writeln([dateandtime,T]),
	%% worked well with abc out of 10
	trialy2("a",R1),
	trialy2("b",R2),
	trialy2("c",R3),
	trialy2("d",R4),
	trialy2("e",R5),/**
	trialy2("f",R6),
	trialy2("g",R7),
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
	R=[R1,R2,R3,R4,R5/**,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27**/
	],
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,_Item]|_Rest],writeln(RB),read_string(user_input,1,_).%%writeln(RB).

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
	trialy1(R15),/****/
	R=[R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15],%%,],
	%%(member(true,R)->(
	aggregate_all(count, member(true,R), Count),
	RA=[Count,Label].%%,writeln([Label,Count,"/10"]));true).
		
trialy1(R1) :-
	trial0(A1), %% Control
	trial0(A2), %% Test 1
	(A1>A2->R1=true;R1=fail).

trial0(Av) :- N is 10, trial1(N,0,S),
	Av is S/N.

trial1(0,A,A) :- !.
trial1(N,A,B) :- mindreadtest(S), A1 is A+S,
	N1 is N-1,trial1(N1,A1,B).
	
mindreadtest(Sec) :-
	%% 250 br for characters to be br out with 10 br each from person to me - do when initial 250 br test done and doing 10 br test
	%%comment(fiftyastest),
	%%random(X),X1 is 10*X, X2 is floor(X1), (X2=<2 -> (
	%%texttobr,writeln(['true test']), %%); %% use breasonings breasoned out by computer for not by me, for job medicine for "me", at last time point
	%%true), %% leave last time point blank
	get_time(TimeStamp1),
	%%phrase_from_file(string(_String), 'file.txt'),
	texttobr2, %% test breasonings breasoned out by computer for not by me, for job medicine for "me", at last time point
	get_time(TimeStamp2),
	%%comment(turnoffas),
    Sec is TimeStamp2 - TimeStamp1.
    
/**string(String) --> list(String).

list([]) --> [].
list([L|Ls]) --> [L], list(Ls).

comment(fiftyastest).
comment(turnoffas).
**/