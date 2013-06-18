(
  module M
      struct
      (
        class
        (
            params =
                (
                )
            class name = x
            class expr =
                fun
                label=""
                                _
                  class_structure
                    (
                      method m
                        42
                                            )
        )
      )
      signature
      (
          sig_class
          (
            class_description ([3,18+11]..[3,18+47])
              pci_virt = Concrete
              pci_params =
                  (
                  )
              pci_name = "x"
              pci_expr =
                class_type ([3,18+15]..[3,18+47])
                  Pcty_fun ""
                     int
                    (
                    )
                  class_type ([3,18+22]..[3,18+47])
                    Pcty_signature
                    class_signature
                        Ptyp_any
                      (
                        Pctf_meth "m" Public ([3,18+29]..[3,18+43])
                            poly
                            
                               int
                              (
                              )
                      )
          )
      )
)

