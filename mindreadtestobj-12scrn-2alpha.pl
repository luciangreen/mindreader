%%use_module(library(pio)).

:- use_module(library(date)).
:- include('mindreadtestshared').
:- include('../Text-to-Breasonings/texttobr2qb.pl').

%%sectest0 :-
%%repeat,sectest,sectest0.
%%sectest(S) :- sectest(7,0,S).
sectest(0):-!.
sectest(N):-
	%%writeln(["Think of the lowercase letter of the alphabet or a space that the computer thought of in 1 second."]),
	%%sleep(1),
	%% Test thought here., 0.1 s then repeat M times
	%%writeln(["Now"]),
	%%get_time(TS),stamp_date_time(TS,T,local),writeln([dateandtime,T]),
	trialy2_81("a",R1),
	trialy2_81("b",R2),
	trialy2_81("c",R3),
	trialy2_81("d",R4),
	trialy2_81("e",R5),
	trialy2_81("f",R6),
	trialy2_81("g",R7),
	trialy2_81("h",R8),
	trialy2_81("i",R9),
	trialy2_81("j",R10),
	trialy2_81("k",R11),
	trialy2_81("l",R12),
	trialy2_81("m",R13),
	trialy2_81("n",R14),
	trialy2_81("o",R15),
	trialy2_81("p",R16),
	trialy2_81("q",R17),
	trialy2_81("r",R18),
	trialy2_81("s",R19),
	trialy2_81("t",R20),
	trialy2_81("u",R21),
	trialy2_81("v",R22),
	trialy2_81("w",R23),
	trialy2_81("x",R24),
	trialy2_81("y",R25),
	trialy2_81("z",R26),
	trialy2_81(" ",R27),
	R=[R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27],
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Item]|_Rest],writeln([Item,RB]),
	N1 is N-1,
	sectest(N1).
