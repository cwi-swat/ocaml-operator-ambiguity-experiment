(
  module TT
    struct
    (
      module IntSet
          Set.Make
        (
          struct
          (
            type
            (
              t
                type
                  params =
                    (
                    )
                  cstrs =
                    (
                    )
                  kind =
                    
                         int
                        (
                        )
            )
            let
            (
              compare
                compare
            )
          )
        )
    )
  let
  (
    ()
          let
      (
        (
          f
            (
              case
              (
                flag
                let module T
                (
                  TT
                )
                in
                (
                let
                (
                  (
                    _
                      match
                      flag
                      (
                        case
                        (
                          Ppat_variant "A"
                                                    0
                        )
                        case
                        (
                          Ppat_variant "B"
                            r
                          r
                        )
                      )
                  )
                in
                  let
                  (
                    (
                      _
                        match
                        flag
                        (
                          case
                          (
                            Ppat_variant "A"
                                                        T.IntSet.mem
                          )
                          case
                          (
                            Ppat_variant "B"
                              r
                            r
                          )
                        )
                    )
                  in
                    ()
                                      )
                )
                )
              )
            )
        )
      in
        f
        (
            Pexp_variant "A"
                    )
      )
  )
)

