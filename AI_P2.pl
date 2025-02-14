prerequisite(cs33, cs166).
prerequisite(cs32, cs126).
prerequisite(cs15, cs16).
prerequisite(cs17, cs18).
prerequisite(cs22, cs126).
prerequisite(cs22, cs141).
prerequisite(cs16_or_cs18, cs32).
prerequisite(cs16_or_cs18, cs33).

optionP(cs16, cs32).
optionP(cs16, cs33).
optionP(cs16, cs141).
optionP(cs18, cs32).
optionP(cs18, cs33).
optionP(cs18, cs141).

offered(cs15, fall).
offered(cs17, fall).
offered(cs33, fall).
offered(cs141, fall).


offered(cs16, spring).
offered(cs18, spring).
offered(cs22, spring).
offered(cs32, spring).
offered(cs166, spring).


introductory(cs15).
introductory(cs17).
introductory(cs22).


introductory(X) :-offered(X, fall), prerequisite(none, X).

introductory(X) :-offered(X, spring), prerequisite(none, Y),prerequisite(Y, X).





intermediate(X) :- prerequisite(Y, X), introductory(Y).





upper_level(X) :-
    prerequisite(Y, X),
    not(introductory(Y)),
    not(intermediate(X)).

upper_level(X) :-
    X = cs126,
    prerequisite(cs22, X),
    prerequisite(Z, X),
    introductory(Z).






courseLevel(X, upper_level) :- upper_level(X),
  not( intermediate(X)),
    not( introductory(X)).
courseLevel(X, intermediate) :- intermediate(X),
  not(upper_level(X)),
    not( introductory(X)).
courseLevel(X, introductory) :- introductory(X),
  not( upper_level(X)),
    not(intermediate(X)).






has_taken(sarah, cs15).
has_taken(sarah, cs22).
has_taken(rana, cs16).
has_taken(rana, cs17).

 has_taken(sarah, basic_course1).
has_taken(sarah, intermediate_course).

prerequisite(intermediate_course, basic_course).
prerequisite(intermediate_course, advanced_course).

can_take(Student, Course) :-prerequisite(Prerequisite, Course), has_taken(Student, Prerequisite).
can_take(Student, Course) :-optionP(Prerequisite, Course),has_taken(Student, Prerequisite).
can_take(none, Course) :- prerequisite(none, Course).




has_taken(manal, cs32).

can_take(manal, Course) :- Course \= cs32, false.




