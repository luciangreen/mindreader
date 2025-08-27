%% strings_atoms_numbers.pl - Stub implementation for Philosophy module
%% This provides basic string/atom/number conversion utilities

%% Basic string concatenation if not available
:- if(\+ current_predicate(string_concat/3)).
string_concat(S1, S2, S3) :-
    atom_concat(S1, S2, S3).
:- endif.

%% Concatenate a list into a single string/atom
concat_list2A([], '') :- !.
concat_list2A([H], H) :- !.
concat_list2A([H|T], Result) :-
    concat_list2A(T, TailResult),
    atom_concat(H, TailResult, Result).