%% Name, DOB, Date learned, psych appointment month=1 or 2, psych appointment day, thoughts count

:-include('mind_read.pl').

sectest0 :-
sectest([first,last,dobd,dobm,doby,daylearned,monthlearned,yearlearned,1,0,16]),
sectest([first,last,dobd,dobm,doby,daylearned,monthlearned,yearlearned,1,0,16]).

sectest1 :-
sectest([first,last,dobd,dobm,doby,daylearned,monthlearned,yearlearned,1,0,16]),
sectest([first,last,dobd,dobm,doby,daylearned,monthlearned,yearlearned,1,0,16]).

find_time(H,M,S) :-
	trialy2_15("0",H11),
	trialy2_15("1",H12),
	trialy2_15("2",H13),
	H1L=[H11,H12,H13],
	sort(H1L,H1A),
	reverse(H1A,H1B),
	H1B=[[_,H1]|_Rest1],

	(H1="2"->(
		trialy2_30("0",H21),
		trialy2_30("1",H22),
		trialy2_30("2",H23),
		trialy2_30("3",H24),
		H2L=[H21,H22,H23,H24],
		sort(H2L,H2A),
		reverse(H2A,H2B),
		H2B=[[_,H2]|_Rest2]
	)
	;(	
		trialy2_30("0",H21),
		trialy2_30("1",H22),
		trialy2_30("2",H23),
		trialy2_30("3",H24),
		trialy2_30("4",H25),
		trialy2_30("5",H26),
		trialy2_30("6",H27),
		trialy2_30("7",H28),
		trialy2_30("8",H29),
		trialy2_30("9",H210),
	
		H2L=[H21,H22,H23,H24,H25,
		H26,H27,H28,H29,H210],
		sort(H2L,H2A),
		reverse(H2A,H2B),
		H2B=[[_,H2]|_Rest2]
	)),

	trialy2_15("0",M11),
	trialy2_15("1",M12),
	trialy2_15("2",M13),
	trialy2_15("3",M14),
	trialy2_15("4",M15),
	trialy2_15("5",M16),
	M1L=[M11,M12,M13,M14,M15,M16],
	sort(M1L,M1A),
	reverse(M1A,M1B),
	M1B=[[_,M1]|_Rest3],

	trialy2_30("0",M21),
	trialy2_30("1",M22),
	trialy2_30("2",M23),
	trialy2_30("3",M24),
	trialy2_30("4",M25),
	trialy2_30("5",M26),
	trialy2_30("6",M27),
	trialy2_30("7",M28),
	trialy2_30("8",M29),
	trialy2_30("9",M210),
	M2L=[M21,M22,M23,M24,M25,M26,M27,M28,M29,M210],
	sort(M2L,M2A),
	reverse(M2A,M2B),
	M2B=[[_,M2]|_Rest4],

	trialy2_15("0",S11),
	trialy2_15("1",S12),
	trialy2_15("2",S13),
	trialy2_15("3",S14),
	trialy2_15("4",S15),
	trialy2_15("5",S16),
	S1L=[S11,S12,S13,S14,S15,S16],
	sort(S1L,S1A),
	reverse(S1A,S1B),
	S1B=[[_,S1]|_Rest5],

	trialy2_30("0",S21),
	trialy2_30("1",S22),
	trialy2_30("2",S23),
	trialy2_30("3",S24),
	trialy2_30("4",S25),
	trialy2_30("5",S26),
	trialy2_30("6",S27),
	trialy2_30("7",S28),
	trialy2_30("8",S29),
	trialy2_30("9",S210),
	S2L=[S21,S22,S23,S24,S25,S26,S27,S28,S29,S210],
	sort(S2L,S2A),
	reverse(S2A,S2B),
	S2B=[[_,S2]|_Rest6],
	
	string_concat(H1,H2,H),
	string_concat(M1,M2,M),
	string_concat(S1,S2,S).

trialy2_6(Label,RA) :-
	%%writeln([testing,Label]),
	trialy1(R1),
	trialy1(R2),
	trialy1(R3),
	trialy1(R4),
	trialy1(R5),
	trialy1(R6), /**
	trialy1(R7),
	trialy1(R8),
	trialy1(R9),
	trialy1(R10),
	trialy1(R11),
	trialy1(R12),
	trialy1(R13),
	trialy1(R14),
	trialy1(R15),
	trialy1(R16),
	trialy1(R17),
	trialy1(R18),
	trialy1(R19),
	trialy1(R20),
	trialy1(R21),
	trialy1(R22),
	trialy1(R23),
	trialy1(R24),
	trialy1(R25),
	trialy1(R26),
	trialy1(R27),
	trialy1(R28),
	trialy1(R29),
	trialy1(R30), **/
	R=[R1,R2,R3,R4,R5,R6 /**,R7,R8,R9,R10,
	R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,
	R21,R22,R23,R24,R25,R26,R27,R28,R29,R30 **/
	],
	%%(member(true,R)->(
	aggregate_all(count, member(true,R), Count),
	RA=[Count,Label].%%,writeln([Label,Count,"/10"]));true).

trialy2_15(Label,RA) :-
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
	/**
	trialy1(R16),
	trialy1(R17),
	trialy1(R18),
	trialy1(R19),
	trialy1(R20),
	trialy1(R21),
	trialy1(R22),
	trialy1(R23),
	trialy1(R24),
	trialy1(R25),
	trialy1(R26),
	trialy1(R27),
	trialy1(R28),
	trialy1(R29),
	trialy1(R30),**/
	R=[R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,
	R11,R12,R13,R14,R15 /**,R16,R17,R18,R19,R20,
	R21,R22,R23,R24,R25,R26,R27,R28,R29,R30
	**/],
	%%(member(true,R)->(
	aggregate_all(count, member(true,R), Count),
	RA=[Count,Label].%%,writeln([Label,Count,"/10"]));true).

trialy2_30(Label,RA) :-
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
	trialy1(R16),
	trialy1(R17),
	trialy1(R18),
	trialy1(R19),
	trialy1(R20),
	trialy1(R21),
	trialy1(R22),
	trialy1(R23),
	trialy1(R24),
	trialy1(R25),
	trialy1(R26),
	trialy1(R27),
	trialy1(R28),
	trialy1(R29),
	trialy1(R30),
	R=[R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,
	R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,
	R21,R22,R23,R24,R25,R26,R27,R28,R29,R30],
	%%(member(true,R)->(
	aggregate_all(count, member(true,R), Count),
	RA=[Count,Label].%%,writeln([Label,Count,"/10"]));true).

trialy2_81(Label,RA) :-
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
	trialy1(R16),
	trialy1(R17),
	trialy1(R18),
	trialy1(R19),
	trialy1(R20),
	trialy1(R21),
	trialy1(R22),
	trialy1(R23),
	trialy1(R24),
	trialy1(R25),
	trialy1(R26),
	trialy1(R27),
	trialy1(R28),
	trialy1(R29),
	trialy1(R30),
	trialy1(R31),
	trialy1(R32),
	trialy1(R33),
	trialy1(R34),
	trialy1(R35),
	trialy1(R36),
	trialy1(R37),
	trialy1(R38),
	trialy1(R39),
	trialy1(R40),
	trialy1(R41),
	trialy1(R42),
	trialy1(R43),
	trialy1(R44),
	trialy1(R45),
	trialy1(R46),
	trialy1(R47),
	trialy1(R48),
	trialy1(R49),
	trialy1(R50),
	trialy1(R51),
	trialy1(R52),
	trialy1(R53),
	trialy1(R54),
	trialy1(R55),
	trialy1(R56),
	trialy1(R57),
	trialy1(R58),
	trialy1(R59),
	trialy1(R60),
	trialy1(R61),
	trialy1(R62),
	trialy1(R63),
	trialy1(R64),
	trialy1(R65),
	trialy1(R66),
	trialy1(R67),
	trialy1(R68),
	trialy1(R69),
	trialy1(R70),
	trialy1(R71),
	trialy1(R72),
	trialy1(R73),
	trialy1(R74),
	trialy1(R75),
	trialy1(R76),
	trialy1(R77),
	trialy1(R78),
	trialy1(R79),
	trialy1(R80),
	trialy1(R81),
	R=[
	R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,
	R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,
	R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,
	R31,R32,R33,R34,R35,R36,R37,R38,R39,R40,
	R41,R42,R43,R44,R45,R46,R47,R48,R49,R50,
	R51,R52,R53,R54,R55,R56,R57,R58,R59,R60,
	R61,R62,R63,R64,R65,R66,R67,R68,R69,R70,
	R71,R72,R73,R74,R75,R76,R77,R78,R79,R80,
	R81
	],
	%%(member(true,R)->(
	aggregate_all(count, member(true,R), Count),
	RA=[Count,Label].%%,writeln([Label,Count,"/10"]));true).
