%%use_module(library(pio)).

:- use_module(library(date)).
:- include('mindreadtestshared').
:- include('../Text-to-Breasonings/texttobr2qb.pl').

%%sectest0 :-
%%repeat,sectest,sectest0.
sectest(S) :- sectest(7,0,S).
sectest(0,S,S):-!.
sectest(N,S1,S2):-
	writeln(["The computer will think of one of the following thoughts when I let you know."]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["characterbreasoner"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["1451"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["texttobr2"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["daily_regimen_meditation"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["list_prolog_interpreter"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
/**	writeln(["adrian"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	**/
	writeln(["The computer will think of one of the following thoughts in 5 seconds.", "characterbreasoner","1451","texttobr2","daily_regimen_meditation","list_prolog_interpreter"/**,"adrian"
	**/
	]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["Now"]),
	sleep(1),
	random_member(A,["characterbreasoner","1451","texttobr2","daily_regimen_meditation","list_prolog_interpreter"
	/**,"adrian"
	**/
	]),
	%%texttobr2(2), %% for 100 As for screen to display black border
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["Think of the object the computer thought of in 1 second.", "characterbreasoner","1451","texttobr2","daily_regimen_meditation","list_prolog_interpreter"/**,"adrian"
	**/
	]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(1),
	%% Test thought here.
	%%writeln(["Now"]),
	%%get_time(TS),stamp_date_time(TS,T,local),writeln([dateandtime,T]),
	trialy2_15("characterbreasoner",R1),
	trialy2_15("1451",R2),
	trialy2_15("texttobr2",R3),
	trialy2_15("daily_regimen_meditation",R4),
	trialy2_15("list_prolog_interpreter",R5),
	R=[R1,R2,R3,R4,R5],%%,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27],
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Item]|_Rest],writeln(["Computer thought",A,"You thought",Item]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(15),
	N1 is N-1,(A=Item->S3 is S1+1;S3=S1),
	sectest(N1,S3,S2).
		%%read_string(user_input,1,_).
