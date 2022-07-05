:- module(p_logic,[
    formula/4,
    formula/5

    ]).

:- include(arguments).
:- discontiguous formula/4.
:- discontiguous formula/5.



% universal intro
formula(universal,PREDICATE,[NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE):-
    formula(unit,PREDICATE,u_flag,JUSTIFICATION,LINE),
    atom_concat(universal_introduction,LINE,NEW_JUSTIFICATION),
    length([NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE).

% universal elim for atomic formula
formula(unit,PREDICATE,TERM,[NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE):-
    \+ TERM == u_flag,
    \+ TERM == e_flag,
    !,
    formula(universal,PREDICATE,JUSTIFICATION,LINE),
    atom_concat(universal_elimination,LINE,NEW_JUSTIFICATION),
    length([NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE).

% existential intro
formula(existential,PREDICATE,[NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE):-
    formula(unit,PREDICATE,_,JUSTIFICATION,LINE),
    atom_concat(existential_introduction,LINE,NEW_JUSTIFICATION),
    length([NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE).

% existential elim

formula(unit,PREDICATE,e_flag,[NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE) :-
    formula(existential,PREDICATE,JUSTIFICATION,LINE),
    \+ formula(universal,PREDICATE,_,_),
    atom_concat(existential_elimination,LINE,NEW_JUSTIFICATION),
    length([NEW_JUSTIFICATION|JUSTIFICATION],NEW_LINE).

% negation

formula(neg,FORMULA,JUSTIFICATION,LINE) :-
    \+ FORMULA.

% modus tollens

formula(neg,FORMULA,[[mt,LINE_A,LINE_B|JUSTIFICATION_A]|JUSTIFICATION_B],LINE) :-
    formula(arrow,FORMULA,CONSE,JUSTIFICATION_A,LINE_A),
    formula(neg,CONSE,JUSTIFICATION_B,LINE_B).

% disjunction elimination
formula(FORMULA_A):-
    formula(dis,FORMULA_A,FORMULA_B),
    formula(neg,FORMULA_B).

formula(FORMULA_B):-
    formula(dis,FORMULA_A,FORMULA_B),
    formula(neg,FORMULA_A).



    
