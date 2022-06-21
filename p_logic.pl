:- module(p_logic,[
    a_formula/2,
    universal/1,
    existential/1]).

:- include(arguments).
:- discontiguous universal/1.
:- discontiguous a_formula/2.
:- discontiguous existential/1.



% universal elim
a_formula(PREDICATE,TERM):-
    \+ TERM == flag,
    universal(PREDICATE).

% existential intro
existential(PREDICATE):-
    a_formula(PREDICATE,_).

% universal intro
universal(PREDICATE):-
    a_formula(PREDICATE,flag).



