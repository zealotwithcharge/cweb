:- begin_tests(p_logic).
:- use_module(p_logic).

test(universal_int1) :-
    formula(universal,necessary,JUSTIFICATION,_),
    JUSTIFICATION = [premise3].

test(universal_int2,[fail]) :-
    formula(universal,impossible,_,_).

test(universal_int3,[fail]) :-
    formula(universal,possible,_,_).

test(universal_int4) :-
    formula(universal,u_flag_test,_,_).

test(universal_elim1) :-
    formula(unit,necessary,salmon,JUSTIFICATION,_),
    JUSTIFICATION = [universal_elimination1,premise3].

test(universal_elim2,[fail]) :-
    formula(unit,impossible,salmon,_,_).

test(universal_elim2,[fail]) :-
    formula(unit,possible,salmon,_,_).

test(existential_int1) :-
    formula(existential,necessary,JUSTIFICATION,LINE),
    JUSTIFICATION = [existential_introduction2,universal_elimination1,premise3],
    LINE = 3.

test(existential_int2,[fail]) :-
    formula(existential,impossible,_,_).

test(existential_int3) :-
    formula(existential,possible,JUSTIFICATION,_),
    JUSTIFICATION = [existential_introduction1,premise2].

test(existential_elim1) :-
    formula(unit,possible,e_flag,JUSTIFICATION,_).

test(existential_elim2,[fail]) :-
    formula(unit,necessary,e_flag,_,_).

test(neg1) :-
    formula(neg,formula(universal,possible,_,_),_,_).

test(neg2,[fail]) :-
    formula(neg,formula(universal,necessary,_,_),_,_).

test(mt1):-
    formula(neg,formula(unit,test,test,_,_),_,_).

test(mt2,[fail]):-
    formula(neg,formula(universal,necessary,_,_),_,_).

:- end_tests(p_logic).
