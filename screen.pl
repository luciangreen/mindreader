%% screen.pl

%% Breason out 10 scrnsongs

:- include('../Text-to-Breasonings/text_to_breasonings.pl').

%% run postsong/postsong.
%% before sectest0.

sectest0 :-
 %% Pixel grid is 10 cm above centre of MacBook Air camera
 %% Pixels are 1,1,1 mm, facing west
 %% Pixels are on for 5 seconds
 %% 0,0 is origin
 
 %% For Cosmology to work:
 	texttobr2(1000), %% 100 done-up As * 10 songs
	texttobr2(2), %% dot on graciously give, graciously give
	texttobr2(20), %% spiritually play 10 songs to light pixel

 /**light([
 [0,0,black],[1,0,white],
 [0,1,black],[1,1,white],
 [0,2,black],[1,2,white],
 [0,3,black],[1,3,white],
 [0,4,black],[1,4,white],
 [0,5,black],[1,5,white],
 [0,6,black],[1,6,white],
 [0,7,black],[1,7,white],
 [0,8,black],[1,8,white],
 [0,9,black],[1,9,white]
 ]).**/
 
 /**light([[1,9,white],[2,9,white],[3,9,black],[4,9,white],[5,9,white],
 [1,8,white],[2,8,white],[3,8,black],[4,8,white],[5,8,white],
 [1,7,white],[2,7,black],[3,7,white],[4,7,black],[5,7,white],
 [1,6,white],[2,6,black],[3,6,white],[4,6,black],[5,6,white],
 [1,5,white],[2,5,black],[3,5,white],[4,5,black],[5,5,white],
 [1,4,black],[2,4,white],[3,4,white],[4,4,white],[5,4,black],
 [1,3,black],[2,3,white],[3,3,white],[4,3,white],[5,3,black],
 [1,2,white],[2,2,white],[3,2,white],[4,2,white],[5,2,white],
 [1,1,white],[2,1,white],[3,1,white],[4,1,white],[5,1,white]]).
**/

%% 1 black, 2 white, 3 red, 4 orange, 5 yellow, 6 green, 7 blue, 8 purple, 9 brown, 10 grey
 random(X),Y is round(10*X),
 light(Y,[[1,9,0],[2,9,0],[3,9,1],[4,9,0],[5,9,0],
 [1,8,0],[2,8,0],[3,8,1],[4,8,0],[5,8,0],
 [1,7,0],[2,7,1],[3,7,0],[4,7,1],[5,7,0],
 [1,6,0],[2,6,1],[3,6,0],[4,6,1],[5,6,0],
 [1,5,0],[2,5,1],[3,5,0],[4,5,1],[5,5,0],
 [1,4,1],[2,4,0],[3,4,0],[4,4,0],[5,4,1],
 [1,3,1],[2,3,0],[3,3,0],[4,3,0],[5,3,1],
 [1,2,0],[2,2,0],[3,2,0],[4,2,0],[5,2,0],
 [1,1,0],[2,1,0],[3,1,0],[4,1,0],[5,1,0]]),
 
 writeln("Displaying 'A' 10 cm above MacBook Air's camera"),
 sleep(5),
 writeln(["1 black, 2 white, 3 red, 4 orange, 5 yellow, 6 green, 7 blue, 8 purple, 9 brown, 10 grey\nColour of Letter A=",Y]).

/**
[]	[]	[1,2]	[]	[]	
[]	[]	[1,2]	[]	[]	
[]	[1]	[]	[2]	[]	
[]	[1]	[]	[2]	[]	
[]	[1,3]	[3]	[2,3]	[]	
[1]	[]	[]	[]	[2]	
[1]	[]	[]	[]	[2]	
[]	[]	[]	[]	[]	
[]	[]	[]	[]	[]	
**/

 
/** 
%% Takes too long, run mindreadtestmusiccomposer-unusual.pl or postsong

prep :-
	ttb2(["scrnsong2019620131426.87270498275757.txt",
"scrnsong2019620131426.87270498275757lyrics.txt",
"scrnsong2019620131428.09975290298462.txt",
"scrnsong2019620131428.09975290298462lyrics.txt",
"scrnsong2019620131430.95198392868042.txt",
"scrnsong2019620131430.95198392868042lyrics.txt",
"scrnsong2019620131432.72644400596619.txt",
"scrnsong2019620131432.72644400596619lyrics.txt",
"scrnsong2019620131435.184492111206055.txt",
"scrnsong2019620131435.184492111206055lyrics.txt",
"scrnsong2019620131437.28680896759033.txt",
"scrnsong2019620131437.28680896759033lyrics.txt",
"scrnsong2019620131438.37197399139404.txt",
"scrnsong2019620131438.37197399139404lyrics.txt",
"scrnsong2019620131439.7610969543457.txt",
"scrnsong2019620131439.7610969543457lyrics.txt",
"scrnsong2019620131442.2528030872345.txt",
"scrnsong2019620131442.2528030872345lyrics.txt",
"scrnsong2019620131443.59552311897278.txt",
"scrnsong2019620131443.59552311897278lyrics.txt"]).

ttb2([]) :- !.
ttb2(List1) :-
	List1=[Item|List2],
	texttobr2(8,Item,u,2000), texttobr(8,Item,u,2000),
	ttb2(List2).
**/

light(_,[]) :- !.
light(WhitetoColour,Pixels1) :-
	Pixels1=[Pixel|Pixels2],
	Pixel=[_X,_Y,Colour1],
	(Colour1=2-> Colour2=WhitetoColour;Colour2=Colour1),
	texttobr2(1000), %% 100 done-up As * 10 songs
	texttobr2(2), %% dot on graciously give, graciously give
	texttobr2(20), %% spiritually play 10 songs to light pixel
	light(WhitetoColour,Pixels2).
	
	%%*** With letter to politics, 