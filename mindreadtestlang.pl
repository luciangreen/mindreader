%% mindreadtestlang-done 250s for vps, local

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
	find("letter",_L),%%writeln(L),
	read_string(user_input,1,_).

findbest(R,Item):-
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Item]|_Rest],writeln(RB).

find("letter",Item1) :-
	trialy2([a,b,c,d,e%%,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,' '
	],R), %% 0 is 0->1 etc.
	findbest(R,Item1).

trialy2(List,R) :-
	%%length(List,L),
	Trials is 15,%%L+3,
	trialy22(List,Trials,[],R).

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