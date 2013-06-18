(
  module type S
    signature
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
                
                          s
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
    )
  module type S'
    Pmty_with
      S
    (
      t
        Pwith_typesubst
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
  module type S
    signature
    (
        sig_recmodule
        (
          "M"
              signature
              (
              )
          "N"
              signature
              (
              )
        )
    )
  module type S'
    Pmty_with
      S
    (
      M
        Pwith_modsubst String
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
          
            )
  class_type
  (
    class_type_declaration ([30,1000+11]..[30,1000+45])
      pci_virt = Concrete
      pci_params =
          (
          )
      pci_name = "c"
      pci_expr =
        class_type ([30,1000+15]..[30,1000+45])
          Pcty_signature
          class_signature
              Ptyp_any
            (
              Pctf_meth "m" Public ([30,1000+22]..[30,1000+41])
                  poly
                  
                     t
                    (
                        Ptyp_variant closed=true
                        (
                          Rtag "A" true
                            (
                            )
                        )
                                            )
            )
  )
  module M
      struct
      (
        let
        (
          v
            (
              case
              (
                x
                sequence
                (
                  ignore
                  (
                      (
                      x
                      :
                                                 c
                          (
                          )
                      )
                  )
                ;
                  x
                )
              )
            )
        )
      )
      signature
      (
          sig_value v
          value_description
              arrow
              
                Ptyp_alias "a"
                  Ptyp_class c
                  (
                  )
                  (
                  )
                a
            (
            )
      )
  let
  (
    id
      let module M
      (
        struct
        (
        )
      )
      in
      (
      (
        case
        (
          x
          x
        )
      )
      )
  )
  let
  (
    ko
      let module M
      (
        struct
        (
        )
      )
      in
      (
      (
        case
        (
          _
          ()
                  )
      )
      )
  )
)

