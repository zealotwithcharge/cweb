:- module(p_logic,[
    a_formula/2,
    universal/1,
    existential/1]).

:- include(arguments).
:- discontiguous universal/1.
:- discontiguous a_formula/2.
:- discontiguous existential/1.



% universal intro
universal(PREDICATE):-
    a_formula(PREDICATE,u_flag).

% universal elim
a_formula(PREDICATE,TERM):-
    \+ TERM == u_flag,
    \+ TERM == e_flag,
    !,
    universal(PREDICATE).

% existential intro
existential(PREDICATE):-
    a_formula(PREDICATE,_).

% existential elim

a_formula(PREDICATE,e_flag) :-
    existential(PREDICATE),
    \+ universal(PREDICATE).
