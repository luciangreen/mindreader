:- include('../Text-to-Breasonings/text_to_breasonings.pl').

postsong(0) :- !.
postsong(N1) :-
	texttobr2(3), %% give self breasonings
 	texttobr2(20), %%Feature 1
 	texttobr2(20), %%Updates
 	texttobr2(20), %%Feature 2
 	texttobr2(20), %%Updates
 	texttobr2(20), %%Feature 3
 	texttobr2(20), %%Updates
 	texttobr2(100), %%Icon
 	texttobr2(20), %%Updates
 	texttobr2(32), %%Lyrics
 	texttobr2(36), %%Music
 	texttobr2(20), %%Updates
 	
 	texttobr2(2), %%Medicine
 	texttobr2(20), %%Updates
 	texttobr2(2), %%Sales
 	texttobr2(20), %%Updates
 	texttobr2(2), %%Marketing
 	texttobr2(20), %%Updates

 	texttobr2(2), %%Graciously give or blame listener for colour imagery
 	texttobr2(20), %%Updates

 	texttobr2(2), %%Play song
 	texttobr2(2),
 	
 	N2 is N1-1,
 	postsong(N2).