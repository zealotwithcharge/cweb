:- module(p_logic,[
    a_formula/3,
    universal/2,
    existential/2,
    neg/1,
    neg/2


    ]).

:- include(arguments).
:- discontiguous universal/2.
:- discontiguous a_formula/3.
:- discontiguous existential/2.



% universal intro
universal(PREDICATE,[universal_introduction|JUSTIFICATION]):-
    a_formula(PREDICATE,u_flag,JUSTIFICATION).

% universal elim for atomic formula
a_formula(PREDICATE,TERM,[universal_elimination|JUSTIFICATION]):-
    \+ TERM == u_flag,
    \+ TERM == e_flag,
    !,
    universal(PREDICATE,JUSTIFICATION).

% existential intro
existential(PREDICATE,[existential_introduction|JUSTIFICATION]):-
    a_formula(PREDICATE,_,JUSTIFICATION).

% existential elim

a_formula(PREDICATE,e_flag,[existential_elimination|JUSTIFICATION]) :-
    existential(PREDICATE,JUSTIFICATION),
    \+ universal(PREDICATE,_).

% negation

neg(FORMULA) :-
    \+ FORMULA.

% modus tollens

neg(FORMULA,mt) :-
    arrow(FORMULA,CONSE),
    neg(CONSE).




    
