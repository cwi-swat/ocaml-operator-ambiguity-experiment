(
  type
  (
    termpc
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
                Rtag "And" false
                  (
                      tuple
                      (
                          a
                          a
                      )
                  )
                Rtag "Or" false
                  (
                      tuple
                      (
                          a
                          a
                      )
                  )
                Rtag "Not" false
                  (
                      a
                  )
                Rtag "Atom" false
                  (
                       string
                      (
                      )
                  )
              )
                )
  type
  (
    termk
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
                Rtag "Dia" false
                  (
                      a
                  )
                Rtag "Box" false
                  (
                      a
                  )
                Rinherit
                     termpc
                    (
                        a
                    )
              )
                )
  module type T
    signature
    (
        type
        (
          term
            type
              params =
                (
                )
              cstrs =
                (
                )
              kind =
                
                        )
        sig_value map
        value_description
            arrow
            
              arrow
              
                 term
                (
                )
                 term
                (
                )
              arrow
              
                 term
                (
                )
                 term
                (
                )
          (
          )
        sig_value nnf
        value_description
            arrow
            
               term
              (
              )
               term
              (
              )
          (
          )
        sig_value nnf_not
        value_description
            arrow
            
               term
              (
              )
               term
              (
              )
          (
          )
    )
  module Fpc
    functor X
    (
      Pmty_with
        T
      (
        term
          Pwith_type
            type
              params =
                (
                )
              cstrs =
                (
                )
              kind =
                
                    Ptyp_alias "a"
                      Ptyp_variant closed=false
                      (
                        Rinherit
                             termpc
                            (
                                a
                            )
                      )
                            )
      struct
      (
        type
        (
          term
            type
              params =
                (
                )
              cstrs =
                (
                )
              kind =
                
                     termpc
                    (
                         X.term
                        (
                        )
                    )
        )
        let
        (
          nnf
            (
              case
              (
                Ppat_alias "x"
                Ppat_variant "Not"
                  Ppat_variant "Atom"
                    _
                x
              )
              case
              (
                Ppat_variant "Not"
                  x
                X.nnf_not
                (
                    x
                )
              )
              case
              (
                x
                X.map
                (
                    X.nnf
                    x
                )
              )
            )
        )
        let
        (
          map
            (
              case
              (
                f
                (
                (
                  case
                  (
                    Ppat_variant "Not"
                      x
                    Pexp_variant "Not"
                      f
                      (
                          x
                      )
                  )
                  case
                  (
                    Ppat_variant "And"
                      (
                        x
                        y
                      )
                    Pexp_variant "And"
                      (
                        f
                        (
                            x
                        )
                        f
                        (
                            y
                        )
                      )
                  )
                  case
                  (
                    Ppat_variant "Or"
                      (
                        x
                        y
                      )
                    Pexp_variant "Or"
                      (
                        f
                        (
                            x
                        )
                        f
                        (
                            y
                        )
                      )
                  )
                  case
                  (
                    Ppat_alias "x"
                    Ppat_variant "Atom"
                      _
                    x
                  )
                )
                :
                    arrow
                    
                       term
                      (
                      )
                       X.term
                      (
                      )
                                )
              )
            )
        )
        let
        (
          nnf_not
            (
            (
              case
              (
                Ppat_variant "Not"
                  x
                X.nnf
                (
                    x
                )
              )
              case
              (
                Ppat_variant "And"
                  (
                    x
                    y
                  )
                Pexp_variant "Or"
                  (
                    X.nnf_not
                    (
                        x
                    )
                    X.nnf_not
                    (
                        y
                    )
                  )
              )
              case
              (
                Ppat_variant "Or"
                  (
                    x
                    y
                  )
                Pexp_variant "And"
                  (
                    X.nnf_not
                    (
                        x
                    )
                    X.nnf_not
                    (
                        y
                    )
                  )
              )
              case
              (
                Ppat_alias "x"
                Ppat_variant "Atom"
                  _
                Pexp_variant "Not"
                  x
              )
            )
            :
                arrow
                
                   term
                  (
                  )
                  Ptyp_any
                        )
        )
      )
    )
  module Fk
    functor X
    (
      Pmty_with
        T
      (
        term
          Pwith_type
            type
              params =
                (
                )
              cstrs =
                (
                )
              kind =
                
                    Ptyp_alias "a"
                      Ptyp_variant closed=false
                      (
                        Rinherit
                             termk
                            (
                                a
                            )
                      )
                            )
      struct
      (
        type
        (
          term
            type
              params =
                (
                )
              cstrs =
                (
                )
              kind =
                
                     termk
                    (
                         X.term
                        (
                        )
                    )
        )
        module Pc
            Fpc
          (
            X
          )
        let
        (
          map
            (
              case
              (
                f
                (
                (
                  case
                  (
                    Ppat_variant "Dia"
                      x
                    Pexp_variant "Dia"
                      f
                      (
                          x
                      )
                  )
                  case
                  (
                    Ppat_variant "Box"
                      x
                    Pexp_variant "Box"
                      f
                      (
                          x
                      )
                  )
                  case
                  (
                    Ppat_alias "x"
                    pat_type                    termpc
                    Pc.map
                    (
                        f
                        x
                    )
                  )
                )
                :
                    arrow
                    
                       term
                      (
                      )
                      Ptyp_any
                                )
              )
            )
        )
        let
        (
          nnf
            Pc.nnf
        )
        let
        (
          nnf_not
            (
            (
              case
              (
                Ppat_variant "Dia"
                  x
                Pexp_variant "Box"
                  X.nnf_not
                  (
                      x
                  )
              )
              case
              (
                Ppat_variant "Box"
                  x
                Pexp_variant "Dia"
                  X.nnf_not
                  (
                      x
                  )
              )
              case
              (
                Ppat_alias "x"
                pat_type                termpc
                Pc.nnf_not
                (
                    x
                )
              )
            )
            :
                arrow
                
                   term
                  (
                  )
                  Ptyp_any
                        )
        )
      )
    )
)

