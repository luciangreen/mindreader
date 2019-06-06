%% Won't work because tests a computation, not mind reads

%% mind read test

%% Make files different for different tests

/**
1. Breason out 250 br A - as receiver/idea	
2. Time this for A for the topic breasoned out and not breasoned out at random intervals for an interval of time (not to do with the random intervals), person to me
3. Does it take considerably longer for detected As? - calculate median of mostly hopefully false trials and differences from it x labelled graph first - do 10 trials over 10 minutes with 3 hopefully successful attempts that are labelled

In addition to 250s for mindreadtestobj and mindreadtestlang, 250s for quarter master and object bo-x left right front back top bottom protection and off (18 250s)

**/

%%use_module(library(pio)).

:- use_module(library(date)).
:- include('texttobr2qb').

sectest:-
	get_time(TS),stamp_date_time(TS,T,local),writeln([dateandtime,T]),
	trialy2("2-3=6"),
	trialy2("2+3=6"),
	trialy2("2*3=6"),
	trialy2("2/3=6"),
	trialy2("2^3=6").

trialy2(Label) :-
	writeln([testing,Label]),
	trialy1(R1),
	trialy1(R2),
	trialy1(R3),
	R=[R1,R2,R3],
	(member(true,R)->(aggregate_all(count, member(true,R), Count),writeln([Label,Count,"/3"]));true).
		
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