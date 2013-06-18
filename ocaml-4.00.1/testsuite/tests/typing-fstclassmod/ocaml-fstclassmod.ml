(
  let
  (
    sort
      Pexp_newtype "s"
      (
        case
        (
          set
          (
            case
            (
              l
              let module Set
              (
                Pmod_unpack
                (
                set
                :
                    Ptyp_package Set.S
                    (
                      with type elt
                         s
                        (
                        )
                    )
                                )
              )
              in
              (
              Set.elements
              (
                  List.fold_right
                  (
                      Set.add
                      l
                      Set.empty
                  )
              )
              )
            )
          )
        )
      )
  )
  let
  (
    make_set
      Pexp_newtype "s"
      (
        case
        (
          cmp
          let module S
          (
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
                        
                             s
                            (
                            )
                )
                let
                (
                  compare
                    cmp
                )
              )
            )
          )
          in
          (
          (
          Pexp_pack            S
          :
              Ptyp_package Set.S
              (
                with type elt
                   s
                  (
                  )
              )
                    )
          )
        )
      )
  )
  let
  (
    both
      (
        case
        (
          l
          List.map
          (
              (
                case
                (
                  set
                  sort
                  (
                      set
                      l
                  )
                )
              )
              ::
                (
                  make_set
                  (
                      compare
                  )
                  ::
                    (
                      make_set
                      (
                          (
                            case
                            (
                              x
                              (
                                case
                                (
                                  y
                                  compare
                                  (
                                      y
                                      x
                                  )
                                )
                              )
                            )
                          )
                      )
                      []
                                          )
                )
          )
        )
      )
  )
  let
  (
    ()
          print_endline
      (
          String.concat
          (
              "  "
              List.map
              (
                  String.concat
                  (
                      "/"
                  )
                  both
                  (
                      ::
                        (
                          "abc"
                          ::
                            (
                              "xyz"
                              ::
                                (
                                  "def"
                                  []
                                                                  )
                            )
                        )
                  )
              )
          )
      )
  )
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
                
                        )
        sig_value to_string
        value_description
            arrow
            
               t
              (
              )
               string
              (
              )
          (
          )
        sig_value apply
        value_description
            arrow
            
               t
              (
              )
               t
              (
              )
          (
          )
        sig_value x
        value_description
             t
            (
            )
          (
          )
    )
  let
  (
    create
      Pexp_newtype "s"
      (
        case
        (
          to_string
          (
            case
            (
              apply
              (
                case
                (
                  x
                  let module M
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
                              
                                   s
                                  (
                                  )
                      )
                      let
                      (
                        to_string
                          to_string
                      )
                      let
                      (
                        apply
                          apply
                      )
                      let
                      (
                        x
                          x
                      )
                    )
                  )
                  in
                  (
                  (
                  Pexp_pack                    M
                  :
                      Ptyp_package S
                      (
                        with type t
                           s
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
      )
  )
  let
  (
    forget
      Pexp_newtype "s"
      (
        case
        (
          x
          let module M
          (
            Pmod_unpack
            (
            x
            :
                Ptyp_package S
                (
                  with type t
                     s
                    (
                    )
                )
                        )
          )
          in
          (
          (
          Pexp_pack            M
          :
              Ptyp_package S
              (
              )
                    )
          )
        )
      )
  )
  let
  (
    print
      (
        case
        (
          x
          let module M
          (
            Pmod_unpack
            (
            x
            :
                Ptyp_package S
                (
                )
                        )
          )
          in
          (
          print_endline
          (
              M.to_string
              (
                  M.x
              )
          )
          )
        )
      )
  )
  let
  (
    apply
      (
        case
        (
          x
          let module M
          (
            Pmod_unpack
            (
            x
            :
                Ptyp_package S
                (
                )
                        )
          )
          in
          (
          let module N
          (
            struct
            (
              include
              (
                M
              )
              let
              (
                x
                  apply
                  (
                      x
                  )
              )
            )
          )
          in
          (
          (
          Pexp_pack            N
          :
              Ptyp_package S
              (
              )
                    )
          )
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
          int
            forget
            (
                create
                (
                    string_of_int
                    succ
                    0
                )
            )
        )
      in
        let
        (
          (
            str
              forget
              (
                  create
                  (
                      (
                        case
                        (
                          s
                          s
                        )
                      )
                      (
                        case
                        (
                          s
                          ^
                          (
                              s
                              s
                          )
                        )
                      )
                      "X"
                  )
              )
          )
        in
          List.iter
          (
              print
              List.map
              (
                  apply
                  ::
                    (
                      int
                      ::
                        (
                          apply
                          (
                              int
                          )
                          ::
                            (
                              apply
                              (
                                  apply
                                  (
                                      str
                                  )
                              )
                              []
                                                          )
                        )
                    )
              )
          )
        )
      )
  )
  module TypEq
      struct
      (
        type
        (
          t
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
                
                     unit
                    (
                    )
        )
        let
        (
          apply
            (
              case
              (
                _
                Obj.magic
              )
            )
        )
        let
        (
          refl
            ()
                    )
        let
        (
          sym
            (
              case
              (
                ()
                                ()
                              )
            )
        )
      )
      signature
      (
          type
          (
            t
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
                  
                            )
          sig_value apply
          value_description
              arrow
              
                 t
                (
                    a
                    b
                )
                arrow
                
                  a
                  b
            (
            )
          sig_value refl
          value_description
               t
              (
                  a
                  a
              )
            (
            )
          sig_value sym
          value_description
              arrow
              
                 t
                (
                    a
                    b
                )
                 t
                (
                    b
                    a
                )
            (
            )
      )
  Pstr_recmodule
  (
    "Typ"
        signature
        (
            sig_modtype PAIR
            Pmodtype_manifest
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
                            
                                                )
                    type
                    (
                      t1
                        type
                          params =
                            (
                            )
                          cstrs =
                            (
                            )
                          kind =
                            
                                                )
                    type
                    (
                      t2
                        type
                          params =
                            (
                            )
                          cstrs =
                            (
                            )
                          kind =
                            
                                                )
                    sig_value eq
                    value_description
                         TypEq.t
                        (
                             t
                            (
                            )
                            tuple
                            (
                                 t1
                                (
                                )
                                 t2
                                (
                                )
                            )
                        )
                      (
                      )
                    sig_value t1
                    value_description
                         Typ.typ
                        (
                             t1
                            (
                            )
                        )
                      (
                      )
                    sig_value t2
                    value_description
                         Typ.typ
                        (
                             t2
                            (
                            )
                        )
                      (
                      )
                )
            type
            (
              typ
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
                        Int
                          (
                               TypEq.t
                              (
                                  a
                                   int
                                  (
                                  )
                              )
                          )
                                                  String
                          (
                               TypEq.t
                              (
                                  a
                                   string
                                  (
                                  )
                              )
                          )
                                                  Pair
                          (
                              Ptyp_package PAIR
                              (
                                with type t
                                  a
                              )
                          )
                                                )
                                )
        )
        struct
        (
          module type PAIR
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
                        
                                        )
                type
                (
                  t1
                    type
                      params =
                        (
                        )
                      cstrs =
                        (
                        )
                      kind =
                        
                                        )
                type
                (
                  t2
                    type
                      params =
                        (
                        )
                      cstrs =
                        (
                        )
                      kind =
                        
                                        )
                sig_value eq
                value_description
                     TypEq.t
                    (
                         t
                        (
                        )
                        tuple
                        (
                             t1
                            (
                            )
                             t2
                            (
                            )
                        )
                    )
                  (
                  )
                sig_value t1
                value_description
                     Typ.typ
                    (
                         t1
                        (
                        )
                    )
                  (
                  )
                sig_value t2
                value_description
                     Typ.typ
                    (
                         t2
                        (
                        )
                    )
                  (
                  )
            )
          type
          (
            typ
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
                      Int
                        (
                             TypEq.t
                            (
                                a
                                 int
                                (
                                )
                            )
                        )
                                              String
                        (
                             TypEq.t
                            (
                                a
                                 string
                                (
                                )
                            )
                        )
                                              Pair
                        (
                            Ptyp_package PAIR
                            (
                              with type t
                                a
                            )
                        )
                                            )
                            )
        )
  )
  open Typ
  let
  (
    int
      Int
        TypEq.refl
  )
  let
  (
    str
      String
        TypEq.refl
  )
  let
  (
    pair
      Pexp_newtype "s1"
      Pexp_newtype "s2"
      (
        case
        (
          t1
          (
            case
            (
              t2
              let module P
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
                          
                              tuple
                              (
                                   s1
                                  (
                                  )
                                   s2
                                  (
                                  )
                              )
                  )
                  type
                  (
                    t1
                      type
                        params =
                          (
                          )
                        cstrs =
                          (
                          )
                        kind =
                          
                               s1
                              (
                              )
                  )
                  type
                  (
                    t2
                      type
                        params =
                          (
                          )
                        cstrs =
                          (
                          )
                        kind =
                          
                               s2
                              (
                              )
                  )
                  let
                  (
                    eq
                      TypEq.refl
                  )
                  let
                  (
                    t1
                      t1
                  )
                  let
                  (
                    t2
                      t2
                  )
                )
              )
              in
              (
              let
              (
                (
                  pair
                    (
                    Pexp_pack                      P
                    :
                        Ptyp_package PAIR
                        (
                          with type t
                            tuple
                            (
                                 s1
                                (
                                )
                                 s2
                                (
                                )
                            )
                        )
                                        )
                )
              in
                Pair
                  pair
              )
              )
            )
          )
        )
      )
  )
  Pstr_recmodule
  (
    "Print"
        signature
        (
            sig_value to_string
            value_description
                arrow
                
                   Typ.typ
                  (
                      a
                  )
                  arrow
                  
                    a
                     string
                    (
                    )
              (
              )
        )
        struct
        (
          let
          (
            to_string
              Pexp_newtype "s"
              (
                case
                (
                  t
                  (
                    case
                    (
                      x
                      match
                      t
                      (
                        case
                        (
                          Int
                            eq
                          string_of_int
                          (
                              TypEq.apply
                              (
                                  eq
                                  x
                              )
                          )
                        )
                        case
                        (
                          String
                            eq
                          Printf.sprintf
                          (
                              "%S"
                              TypEq.apply
                              (
                                  eq
                                  x
                              )
                          )
                        )
                        case
                        (
                          Pair
                            p
                          let module P
                          (
                            Pmod_unpack
                            (
                            p
                            :
                                Ptyp_package PAIR
                                (
                                  with type t
                                     s
                                    (
                                    )
                                )
                                                        )
                          )
                          in
                          (
                          let
                          (
                            (
                              (
                                x1
                                x2
                              )
                                TypEq.apply
                                (
                                    P.eq
                                    x
                                )
                            )
                          in
                            Printf.sprintf
                            (
                                "(%s,%s)"
                                Print.to_string
                                (
                                    P.t1
                                    x1
                                )
                                Print.to_string
                                (
                                    P.t2
                                    x2
                                )
                            )
                          )
                          )
                        )
                      )
                    )
                  )
                )
              )
          )
        )
  )
  let
  (
    ()
          sequence
      (
        print_endline
        (
            Print.to_string
            (
                int
                10
            )
        )
      ;
        print_endline
        (
            Print.to_string
            (
                pair
                (
                    int
                    pair
                    (
                        str
                        int
                    )
                )
                (
                  123
                  (
                    "A"
                    456
                  )
                )
            )
        )
      )
  )
)

