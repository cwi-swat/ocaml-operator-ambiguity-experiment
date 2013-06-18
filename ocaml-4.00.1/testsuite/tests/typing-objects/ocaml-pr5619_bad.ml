(
  class_type
  (
    class_type_declaration ([1,0+11]..[4,51+5])
      pci_virt = Concrete
      pci_params =
          (
          )
      pci_name = "foo_t"
      pci_expr =
        class_type ([2,19+2]..[4,51+5])
          Pcty_signature
          class_signature
              Ptyp_any
            (
              Pctf_meth "foo" Public ([3,28+4]..[3,28+22])
                  poly
                  
                     string
                    (
                    )
            )
  )
  type
  (
    name
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
            (
              Foo
                (
                )
                     name
                    (
                         foo_t
                        (
                        )
                    )
              Int
                (
                )
                     name
                    (
                         int
                        (
                        )
                    )
            )
            )
  class
  (
      params =
          (
          )
      class name = foo
      class expr =
          class_structure
            (
              method foo
                "foo"
                              method cast
                (
                  case
                  (
                    Foo
                                        (
                    self
                    :
                                            Ptyp_object
                        (
                          core_field_type ([16,198+27]..[16,198+39])
                            Pfield "foo"
                              poly
                              
                                 string
                                (
                                )
                        )
                    )
                  )
                  case
                  (
                    _
                    raise
                    (
                        Exit
                                            )
                  )
                )
                            )
  )
  class
  (
      params =
          (
          )
      class name = foo
      class expr =
          constraint
            class_structure
              (
                method foo
                  "foo"
                                  method cast
                  Pexp_newtype "a"
                  (
                  (
                    case
                    (
                      Foo
                                            (
                      self
                      :
                                                 foo_t
                          (
                          )
                      )
                    )
                    case
                    (
                      _
                      (
                      raise
                      (
                          Exit
                                                )
                      :
                           a
                          (
                          )
                                            )
                    )
                  )
                  :
                      arrow
                      
                         name
                        (
                             a
                            (
                            )
                        )
                         a
                        (
                        )
                                    )
                      poly
                       'a
                        arrow
                        
                           name
                          (
                              a
                          )
                          a
              )
          class_type ([21,276+11]..[21,276+16])
            Pcty_constr foo_t
            (
            )
  )
)

