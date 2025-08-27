 /**

- Form
- Which chord progression type?
- Lyrics - random sentences, rhyming
- Melody - random starting and ending note of first phrase, melody and harmony from chord progression type with three notes (split for melody), the circle of fifths for connection between sections
- Which of up to 3 instruments for each of melody and harmony
- What sections they will play

- Melody cut to the length of vocals

**/

use_module(library(pio)).

%% :- use_module(library(date)). %% Not needed - functionality is commented out
%%:-include('texttobr2qb').
%%:-include('mindreadtestshared').
%%:-include('texttobr2').
%%:-include('texttobr').
%%:-include('texttobr2qbmusic').

%:-include('musiclibrary').
%:-include('../listprologinterpreter/listprolog.pl').
:-include('mind_read_la_strings.pl').
%:-include('make_mind_reading_tree4 working1.pl').
:-include('mind_read_mr_tree.pl').
%:-include('instruments_mr-tree.pl').

max([],M,M) :- !.
max(List1,Max1,Max2) :-
	List1=[Item|List2],
	Item>=Max1,
	max(List2,Item,Max2),!.
max(List1,Max1,Max2) :-
	List1=[Item|List2],
	Item<Max1,
	max(List2,Max1,Max2),!.
	
findbest(R,R) :-!.
findbest2(R,Item):-
	sort(R,RA),
	reverse(RA,RB),
	RB=[[_,Item]|_Rest].

find("decimal",Item1) :-
	mind_read(Item1,[0,1,2,3,4,5,6,7,8,9]).

concat_list2A(A1,B):-
	A1=[A|List],
	concat_list2A(A,List,B),!.

concat_list2A(A,[],A):-!.
concat_list2A(A,List,B) :-
	List=[Item|Items],
	string_concat(A,Item,C),
	concat_list2A(C,Items,B).


%mind_read(R,[]) :-
%	R=[[_,['C']]].
/**
mind_read(Item,List0) :-
random_member(Item,List0).
**/
