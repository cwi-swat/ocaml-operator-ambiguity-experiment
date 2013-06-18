(
  type
  (
    t
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_alias "a"
                Ptyp_variant closed=true
                (
                  Rtag "A" false
                    (
                         t
                        (
                             t
                            (
                                a
                            )
                        )
                    )
                )
                  )
  type
  (
    t
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_variant closed=true
              (
                Rtag "A" false
                  (
                       t
                      (
                           t
                          (
                              a
                          )
                      )
                  )
              )
                )
  type
  (
    t
      type
        params =
          (
            a
          )
        cstrs =
          (
            <constraint> ([5,90+38]..[5,90+47])
                a
                 t
                (
                    a
                )
          )
        kind =
          
              Ptyp_variant closed=true
              (
                Rtag "A" false
                  (
                       t
                      (
                           t
                          (
                              a
                          )
                      )
                  )
              )
                )
  type
  (
    t
      type
        params =
          (
            a
          )
        cstrs =
          (
            <constraint> ([7,141+36]..[7,141+45])
                a
                 t
                (
                    a
                )
          )
        kind =
          
              Ptyp_variant closed=true
              (
                Rtag "A" false
                  (
                       t
                      (
                          a
                      )
                  )
              )
                )
  type
  (
    t
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_alias "a"
                Ptyp_variant closed=true
                (
                  Rtag "A" false
                    (
                        a
                    )
                )
                  )
  type
  (
    v
      type
        params =
          (
            a
          )
        cstrs =
          (
            <constraint> ([11,222+35]..[11,222+41])
                a
                 t
                (
                )
          )
        kind =
          
              Ptyp_variant closed=true
              (
                Rtag "A" false
                  (
                       v
                      (
                           u
                          (
                          )
                      )
                  )
              )
                  t
      type
        params =
          (
          )
        cstrs =
          (
          )
        kind =
          
               u
              (
              )
    u
      type
        params =
          (
          )
        cstrs =
          (
          )
        kind =
          
               t
              (
              )
  )
  type
  (
    t
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              a
  )
  let
  (
    f
      (
        case
        (
          x
            Ptyp_alias "a"
               t
              (
                  a
              )
          ()
                  )
      )
  )
  let
  (
    f
      (
        case
        (
          x
             t
            (
                a
            )
          (
            case
            (
              y
                a
              =
              (
                  x
                  y
              )
            )
          )
        )
      )
  )
)

