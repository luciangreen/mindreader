%% mindreadtestobj-12scrn.pl

%% *** Important: initialise program before running for the first time:
%% N is 1*2*3*5,texttobr2(N). %% 100 As for 1 (turned on)*2 (to and from computer)*3 (rb, itself (already done), graciously give or blame, radio button for graciously give or blame)*5 (5 objects)
%% N is 1*2*3*5,texttobr2(N). %% 100 As for 1 (turned off)*2 (to and from computer)*3 (rb, itself (already done), graciously give or blame, radio button for graciously give or blame)*5 (5 objects)
%% also breason out and dot on objects before line above and breason out and dot on when recognising and saying object (with all objects having different breasonings)

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
:- include('mindreadtestshared').
:- include('texttobr2qb').

%%sectest0 :-
%%repeat,sectest,sectest0.
sectest(S) :- sectest(7,0,S).
sectest(0,S,S):-!.
sectest(N,S1,S2):-
	writeln(["The computer will think of one of the following thoughts when I let you know."]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["seed"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["water"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["dam"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["redblackduck"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["lorelle"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
/**	writeln(["adrian"]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	**/
	writeln(["The computer will think of one of the following thoughts in 5 seconds.", "seed","water","dam","redblackduck","lorelle"/**,"adrian"
	**/
	]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["Now"]),
	sleep(1),
	random_member(A,["seed","water","dam","redblackduck","lorelle"
	/**,"adrian"
	**/
	]),
	%%texttobr2(2), %% for 100 As for screen to display black border
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(5),
	writeln(["Think of the object the computer thought of in 1 second.", "seed","water","dam","redblackduck","lorelle"/**,"adrian"
	**/
	]),
	texttobr2(2), %% for 100 As for screen to display white background
	texttobr2(2), %% for 100 As for screen to display A
	sleep(1),
	%% Test thought here.
	%%writeln(["Now"]),
	%%get_time(TS),stamp_date_time(TS,T,local),writeln([dateandtime,T]),
	trialy2_15("seed",R1),
	trialy2_15("water",R2),
	trialy2_15("dam",R3),
	trialy2_15("redblackduck",R4),
	trialy2_15("lorelle",R5),
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
