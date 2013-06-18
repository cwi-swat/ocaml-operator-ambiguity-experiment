(
  type
  (
    expr
      type
        params =
          (
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_variant closed=true
              (
                Rtag "Abs" false
                  (
                      tuple
                      (
                           string
                          (
                          )
                           expr
                          (
                          )
                      )
                  )
                Rtag "App" false
                  (
                      tuple
                      (
                           expr
                          (
                          )
                           expr
                          (
                          )
                      )
                  )
              )
                )
  class_type
  (
    class_type_declaration ([6,67+11]..[9,139+3])
      pci_virt = Concrete
      pci_params =
          (
          )
      pci_name = "exp"
      pci_expr =
        class_type ([7,84+0]..[9,139+3])
          Pcty_signature
          class_signature
              Ptyp_any
            (
              Pctf_meth "eval" Public ([8,91+2]..[8,91+47])
                  poly
                  
                    arrow
                    
                       Hashtbl.t
                      (
                           string
                          (
                          )
                           exp
                          (
                          )
                      )
                       expr
                      (
                      )
            )
  )
  class
  (
      params =
          (
          )
      class name = app
      class expr =
          fun
          label=""
                    e1
            fun
            label=""
                        e2
              constraint
                class_structure
                  (
                    Pcf_val "l" Immutable Fresh ([13,177+2]..[13,177+12])
                      e1
                    Pcf_val "r" Immutable Fresh ([14,190+2]..[14,190+12])
                      e2
                    method eval
                      (
                        case
                        (
                          env
                          match
                          l
                          (
                            case
                            (
                              Ppat_variant "Abs"
                                (
                                  var
                                  body
                                )
                              sequence
                              (
                                Hashtbl.add
                                (
                                    env
                                    var
                                    r
                                )
                              ;
                                body
                              )
                            )
                            case
                            (
                              _
                              Pexp_variant "App"
                                (
                                  l
                                  r
                                )
                            )
                          )
                        )
                      )
                                        )
              class_type ([11,146+18]..[11,146+21])
                Pcty_constr exp
                (
                )
  )
)

