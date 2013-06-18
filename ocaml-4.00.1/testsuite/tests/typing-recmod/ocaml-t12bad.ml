(
  Pstr_recmodule
  (
    "M"
        signature
        (
            sig_class
            (
              class_description ([4,47+12]..[6,123+9])
                pci_virt = Concrete
                pci_params =
                    (
                      "a"
                    )
                pci_name = "c"
                pci_expr =
                  class_type ([4,47+21]..[6,123+9])
                    Pcty_fun ""
                      a
                    class_type ([4,47+27]..[6,123+9])
                      Pcty_signature
                      class_signature
                          Ptyp_any
                        (
                          Pctf_meth "map" Public ([5,81+8]..[5,81+41])
                              poly
                              
                                arrow
                                
                                  arrow
                                  
                                    a
                                    b
                                   M.c
                                  (
                                      b
                                  )
                        )
            )
        )
        struct
        (
          class
          (
              params =
                  (
                    "a"
                  )
              class name = c
              class expr =
                  fun
                  label=""
                                    x
                    a
                    class_structure
                      (
                        method map
                          (
                            case
                            (
                              f
                              new M.c
                              (
                                  f
                                  (
                                      x
                                  )
                              )
                            )
                          )
                              poly
                               'b
                                arrow
                                
                                  arrow
                                  
                                    a
                                    b
                                   M.c
                                  (
                                      b
                                  )
                      )
          )
        )
  )
)

