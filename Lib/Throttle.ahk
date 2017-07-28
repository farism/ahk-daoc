_Run(fn_or_key, args*) {
  if(IsFunc(fn_or_key)) {
    %fn_or_key%(args*)
  } else {
    Send, %fn_or_key%
  }
}

_Throttle(id, fn_or_key, duration := 1000, args*) {
  static throttles := {}

  now := A_Now

  if(throttles.HasKey(%id%)) {
    time := throttles[%id%]
    diff := (now - time) * 1000

    if (diff >= duration) {
      throttles[%id%] := now
      _Run(fn_or_key, args*)
    }
  } else {
    throttles[%id%] := now
    _Run(fn_or_key, args*)
  }

  return
}

Throttle(fn_or_key, duration := 1000, args*) {
  static id := 0
  id := id + 1

  return Func("_Throttle").Bind(id, fn_or_key, duration, args*)
}
