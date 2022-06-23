:- begin_tests(p_logic).
:- use_module(p_logic).

test(universal_int1) :-
    universal(necessary,JUSTIFICATION),
    JUSTIFICATION = [premise].

test(universal_int2,[fail]) :-
    universal(impossible,_).

test(universal_int3,[fail]) :-
    universal(possible,_).

test(universal_int4) :-
    universal(u_flag_test,_).

test(universal_elim1) :-
    a_formula(necessary,salmon,JUSTIFICATION),
    JUSTIFICATION = [universal_elimination,premise].

test(universal_elim2,[fail]) :-
    a_formula(impossible,salmon,_).

test(universal_elim2,[fail]) :-
    a_formula(possible,salmon,_).

test(existential_int1) :-
    existential(necessary,JUSTIFICATION),
    JUSTIFICATION = [existential_introduction,universal_elimination,premise].

test(existential_int2,[fail]) :-
    existential(impossible,_).

test(existential_int3) :-
    existential(possible,JUSTIFICATION),
    JUSTIFICATION = [existential_introduction,premise].

test(existential_elim1) :-
    a_formula(possible,e_flag,JUSTIFICATION),
    JUSTIFICATION = [existential_elimination|_].

test(existential_elim2,[fail]) :-
    a_formula(necessary,e_flag,_).

:- end_tests(p_logic).
