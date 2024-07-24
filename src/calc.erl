-module(calc).
-export([welcome/0, op/1, calcu/3]).

welcome() ->
    io:format("Bienvenido o bienvenida usuario.~n").

op(OP) ->
    case OP of
        1 -> 'suma';
        2 -> 'resta';
        3 -> 'multiplicación';
        4 -> 'división';
        _ -> io:format("Este número no es una operación valida.~n")
    end.

calcu(OP, X, Y) ->
    S = X + Y,
    R = X - Y,
    M = X * Y,
    D = X / Y,
    case OP of
        'suma' -> io:format("~nLa ~p de ~p y ~p es igual a ~p.~n", [OP, X, Y, S]);
        'resta' -> io:format("~nLa ~p de ~p y ~p es igual a ~p.~n", [OP, X, Y, R]);
        'multiplicación' -> io:format("~nLa ~p de ~p y ~p es igual a ~p.~n", [OP, X, Y, M]);
        'división' -> io:format("~nLa ~p de ~p y ~p es igual a ~p.~n", [OP, X, Y, D]);
        _ -> io:format("~nError.~n")
    end.