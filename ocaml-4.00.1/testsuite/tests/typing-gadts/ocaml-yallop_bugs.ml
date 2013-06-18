(
  type
  (
    eq
      type
        params =
          (
            "_"
            "_"
          )
        cstrs =
          (
          )
        kind =
            (
              Refl
                (
                )
                     eq
                    (
                        a
                        a
                    )
            )
            )
  let
  (
    magic
      poly
       'b 'a
        arrow
        
          a
          b
      Pexp_newtype "a"
      Pexp_newtype "b"
      (
        case
        (
          x
             a
            (
            )
          let module M
          (
              functor T
              (
                signature
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
                            
                                                )
                )
                struct
                (
                  let
                  (
                    f
                      (
                        case
                        (
                          Refl
                                                       eq
                            (
                                 T.t
                                (
                                     a
                                    (
                                    )
                                )
                                 T.t
                                (
                                     b
                                    (
                                    )
                                )
                            )
                          (
                          x
                          :
                                                         b
                              (
                              )
                          )
                        )
                      )
                  )
                )
              )
            (
              struct
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
                        
                             unit
                            (
                            )
                )
              )
            )
          )
          in
          (
          M.f
          (
              Refl
                        )
          )
        )
      )
  )
  type
  (
    eq
      type
        params =
          (
            "_"
            "_"
          )
        cstrs =
          (
          )
        kind =
            (
              Refl
                (
                )
                     eq
                    (
                        a
                        a
                    )
            )
            )
  let
  (
    magic
      poly
       'b 'a
        arrow
        
          a
          b
      Pexp_newtype "a"
      Pexp_newtype "b"
      (
        case
        (
          x
             a
            (
            )
          let
          (
            (
              bad_proof
                Pexp_newtype "a"
                (
                Refl
                                :
                     eq
                    (
                        Ptyp_object
                        (
                          core_field_type ([23,481+17]..[23,481+22])
                            Pfield "m"
                              poly
                              
                                 a
                                (
                                )
                        )
                        Ptyp_object
                        (
                          core_field_type ([23,481+26]..[23,481+31])
                            Pfield "m"
                              poly
                              
                                 a
                                (
                                )
                        )
                    )
                     eq
                    (
                        Ptyp_object
                        (
                          core_field_type ([23,481+42]..[23,481+47])
                            Pfield "m"
                              poly
                              
                                 a
                                (
                                )
                        )
                        Ptyp_object
                        (
                        )
                    )
                )
            )
          in
            let
            (
              (
                downcast
                  poly
                   'a
                    arrow
                    
                       eq
                      (
                          a
                          Ptyp_object
                          (
                          )
                      )
                      arrow
                      
                        Ptyp_object
                        (
                        )
                        a
                  Pexp_newtype "a"
                  (
                  Pexp_newtype "a"
                  (
                    case
                    (
                      Refl
                                               eq
                        (
                             a
                            (
                            )
                            Ptyp_object
                            (
                            )
                        )
                      (
                        case
                        (
                          s
                            Ptyp_object
                            (
                            )
                          (
                          s
                          :
                                                         a
                              (
                              )
                          )
                        )
                      )
                    )
                  )
                  :
                      arrow
                      
                         eq
                        (
                             a
                            (
                            )
                            Ptyp_object
                            (
                            )
                        )
                        arrow
                        
                          Ptyp_object
                          (
                          )
                           a
                          (
                          )
                                    )
              )
            in
              send m
              (
                downcast
                (
                    bad_proof
                    (
                    Pexp_object                    class_structure
                      (
                        method m
                          x
                                                )
                    :
                                            Ptyp_object
                        (
                        )
                    )
                )
              )
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
            "_"
          )
        cstrs =
          (
          )
        kind =
            (
              IntLit
                (
                )
                     t
                    (
                         int
                        (
                        )
                    )
              BoolLit
                (
                )
                     t
                    (
                         bool
                        (
                        )
                    )
            )
            )
  let
  (
    check
      poly
       's
        arrow
        
          tuple
          (
               t
              (
                  s
              )
              s
          )
           bool
          (
          )
      Pexp_newtype "s"
      (
      (
        case
        (
          (
            BoolLit
                        false
                      )
          false
                  )
        case
        (
          (
            IntLit
                        6
          )
          false
                  )
      )
      :
          arrow
          
            tuple
            (
                 t
                (
                     s
                    (
                    )
                )
                 s
                (
                )
            )
             bool
            (
            )
            )
  )
  type
  (
    pair
      type
        params =
          (
            a
            b
          )
        cstrs =
          (
          )
        kind =
            (
              fst
                  poly
                  
                    a
              snd
                  poly
                  
                    b
            )
            )
  let
  (
    check
      poly
       's
        arrow
        
           pair
          (
               t
              (
                  s
              )
              s
          )
           bool
          (
          )
      Pexp_newtype "s"
      (
      (
        case
        (
          Ppat_record
          (
            fst
              BoolLit
                          snd
              false
                        )
          false
                  )
        case
        (
          Ppat_record
          (
            fst
              IntLit
                          snd
              6
          )
          false
                  )
      )
      :
          arrow
          
             pair
            (
                 t
                (
                     s
                    (
                    )
                )
                 s
                (
                )
            )
             bool
            (
            )
            )
  )
)

