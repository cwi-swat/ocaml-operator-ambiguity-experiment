(
  class_type
  (
    class_type_declaration ([1,0+11]..[1,0+25])
      pci_virt = Concrete
      pci_params =
          (
          )
      pci_name = "t"
      pci_expr =
        class_type ([1,0+15]..[1,0+25])
          Pcty_signature
          class_signature
              Ptyp_any
            (
            )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = o1
      class expr =
          class_structure
            (
            )
  )
  type
  (
    obj
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
                Ptyp_object
                (
                  core_field_type ([3,75+18]..[3,75+20])
                    Pfield_var
                )
  )
  class_type
  (
    class_type_declaration ([4,107+11]..[4,107+40])
      pci_virt = Concrete
      pci_params =
          (
            "a"
          )
      pci_name = "o2"
      pci_expr =
        class_type ([4,107+21]..[4,107+40])
          Pcty_signature
          class_signature
               obj
              (
                  a
              )
            (
            )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = o3
      class expr =
          class_structure
            (
            )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = o4
      class expr =
          class_structure
            (
              method m
                (
                self
                :
                     obj
                    (
                        a
                    )
                                )
                            )
  )
)

