:- begin_tests(p_logic).
:- use_module(p_logic).

test(universal_int1) :-
    universal(necessary).

test(universal_int2,[fail]) :-
    universal(impossible).

test(universal_int3,[fail]) :-
    universal(possible).

test(universal_elim1) :-
    a_formula(necessary,salmon).

test(universal_elim2,[fail]) :-
    a_formula(impossible,salmon).

test(universal_elim2,[fail]) :-
    a_formula(possible,salmon).

test(existential_int1) :-
    existential(necessary).

test(existential_int2,[fail]) :-
    existential(impossible).

test(existential_int3) :-
    existential(possible).


:- end_tests(p_logic).
