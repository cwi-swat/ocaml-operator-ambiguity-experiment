(
  let
  (
    sort
      Pexp_newtype "s"
      (
        case
        (
          Ppat_unpack "Set"
            Ptyp_package Set.S
            (
              with type elt
                 s
                (
                )
            )
          (
            case
            (
              l
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
  let
  (
    make_set
      Pexp_newtype "s"
      (
        case
        (
          cmp
          (
          Pexp_pack              Set.Make
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
  let
  (
    sort_cmp
      Pexp_newtype "s"
      (
        case
        (
          cmp
          sort
          (
              Pexp_pack                  Set.Make
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
    f
      (
        case
        (
          Ppat_unpack "M"
            Ptyp_package S
            (
              with type t
                 int
                (
                )
            )
          M.x
        )
      )
  )
  let
  (
    f
      (
        case
        (
          Ppat_unpack "M"
            Ptyp_package S
            (
              with type t
                a
            )
          M.x
        )
      )
  )
  let
  (
    f
      Pexp_newtype "a"
      (
        case
        (
          Ppat_unpack "M"
            Ptyp_package S
            (
              with type t
                 a
                (
                )
            )
          M.x
        )
      )
  )
  f
  (
      Pexp_pack        struct
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
            x
              1
          )
        )
  )
  type
  (
    s
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
              s
                  poly
                  
                    Ptyp_package S
                    (
                      with type t
                        a
                    )
            )
            )
  record
  (
    s
      Pexp_pack        struct
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
            x
              1
          )
        )
  )
    let
  (
    f
      (
        case
        (
          Ppat_record
          (
            s
              Ppat_unpack "M"
          )
          M.x
        )
      )
  )
  let
  (
    f
      Pexp_newtype "a"
      (
        case
        (
          Ppat_record
          (
            s
              Ppat_unpack "M"
          )
             s
            (
                 a
                (
                )
            )
          M.x
        )
      )
  )
  type
  (
    s
      type
        params =
          (
          )
        cstrs =
          (
          )
        kind =
            (
              s
                  poly
                  
                    Ptyp_package S
                    (
                      with type t
                         int
                        (
                        )
                    )
            )
            )
  let
  (
    f
      (
        case
        (
          Ppat_record
          (
            s
              Ppat_unpack "M"
          )
          M.x
        )
      )
  )
  let
  (
    f
      (
        case
        (
          Ppat_record
          (
            s
              Ppat_unpack "M"
          )
          (
            case
            (
              Ppat_record
              (
                s
                  Ppat_unpack "N"
              )
              +
              (
                  M.x
                  N.x
              )
            )
          )
        )
      )
  )
  module type S
    signature
    (
        sig_value x
        value_description
             int
            (
            )
          (
          )
    )
  let
  (
    f
      (
        case
        (
          Ppat_unpack "M"
            Ptyp_package S
            (
            )
          (
            case
            (
              y
              (
                case
                (
                  Ppat_unpack "N"
                    Ptyp_package S
                    (
                    )
                  +
                  (
                      +
                      (
                          M.x
                          y
                      )
                      N.x
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
    m
      Pexp_pack        struct
        (
          let
          (
            x
              3
          )
        )
  )
  let
  (
    m
      (
      Pexp_pack        struct
        (
          let
          (
            x
              3
          )
        )
      :
          Ptyp_package S
          (
          )
            )
  )
  f
  (
      m
      1
      m
  )
  f
  (
      m
      1
      Pexp_pack        struct
        (
          let
          (
            x
              2
          )
        )
  )
  let
  (
    (
      Ppat_unpack "M"
        m
    )
  in
    M.x
  )
  let
  (
    Ppat_unpack "M"
      m
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          let Nonrec
          (
            Ppat_unpack "M"
              m
          )
            class_structure
              (
              )
  )
  module M
    Pmod_unpack
    m
  module type S'
    signature
    (
        sig_value f
        value_description
            arrow
            
               int
              (
              )
               int
              (
              )
          (
          )
    )
  let
  (
    (
      Ppat_unpack "M"
        Ptyp_package S'
        (
        )
        (
        Pexp_pack          struct
          (
            let
            (
              f
                (
                  case
                  (
                    n
                    ifthenelse
                    (
                      if
                      (
                        <=
                        (
                            n
                            0
                        )
                      )
                      then
                      (
                        1
                      )
                      else
                      (
                          *
                          (
                              n
                              M.f
                              (
                                  -
                                  (
                                      n
                                      1
                                  )
                              )
                          )
                      )
                    )
                  )
                )
            )
          )
        :
            Ptyp_package S'
            (
            )
                )
    )
  in
    M.f
    (
        3
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
        type
        (
          u
            type
              params =
                (
                )
              cstrs =
                (
                )
              kind =
                
                        )
        sig_value x
        value_description
            tuple
            (
                 t
                (
                )
                 u
                (
                )
            )
          (
          )
    )
  let
  (
    f
      (
        case
        (
          l
             list
            (
                Ptyp_package S
                (
                  with type t
                     int
                    (
                    )
                  with type u
                     bool
                    (
                    )
                )
            )
          (
          l
          :
                         list
              (
                  Ptyp_package S
                  (
                    with type u
                       bool
                      (
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
                
                    tuple
                    (
                        arrow
                        
                          a
                          b
                        arrow
                        
                          b
                          a
                    )
        )
        let
        (
          refl
            (
              (
                case
                (
                  x
                  x
                )
              )
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
          apply
            (
              case
              (
                (
                  f
                  _
                )
                (
                  case
                  (
                    x
                    f
                    (
                        x
                    )
                  )
                )
              )
            )
        )
        let
        (
          sym
            (
              case
              (
                (
                  f
                  g
                )
                (
                  g
                  f
                )
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
                            
                                                  t1
                        type
                          params =
                            (
                            )
                          cstrs =
                            (
                            )
                          kind =
                            
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
        Typ
  )
  let
  (
    int
      Typ.Int
        TypEq.refl
  )
  let
  (
    str
      Typ.String
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
              Typ.Pair
                Pexp_pack                  P
              )
            )
          )
        )
      )
  )
  open Typ
  let
  (
    to_string
      poly
       'a
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
              (
              t
              :
                   typ
                  (
                       s
                      (
                      )
                  )
                            )
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
                    Ppat_unpack "P"
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
                        to_string
                        (
                            P.t1
                            x1
                        )
                        to_string
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
  module type MapT
    signature
    (
        sig_include
          Map.S
        type
        (
          data
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
          map
            type
              params =
                (
                )
              cstrs =
                (
                )
              kind =
                
                        )
        sig_value of_t
        value_description
            arrow
            
               t
              (
                   data
                  (
                  )
              )
               map
              (
              )
          (
          )
        sig_value to_t
        value_description
            arrow
            
               map
              (
              )
               t
              (
                   data
                  (
                  )
              )
          (
          )
    )
  type
  (
    map
      type
        params =
          (
            k
            d
            m
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_package MapT
              (
                with type key
                  k
                with type data
                  d
                with type map
                  m
              )
  )
  let
  (
    add
      Pexp_newtype "k"
      Pexp_newtype "d"
      Pexp_newtype "m"
      (
        case
        (
          m
             map
            (
                 k
                (
                )
                 d
                (
                )
                 m
                (
                )
            )
          (
            case
            (
              x
              (
                case
                (
                  y
                  (
                    case
                    (
                      s
                      let module M
                      (
                        Pmod_unpack
                        (
                        m
                        :
                            Ptyp_package MapT
                            (
                              with type key
                                 k
                                (
                                )
                              with type data
                                 d
                                (
                                )
                              with type map
                                 m
                                (
                                )
                            )
                                                )
                      )
                      in
                      (
                      M.of_t
                      (
                          M.add
                          (
                              x
                              y
                              M.to_t
                              (
                                  s
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
  module SSMap
    struct
    (
      include
      (
          Map.Make
        (
          String
        )
      )
      type
      (
        data
          type
            params =
              (
              )
            cstrs =
              (
              )
            kind =
              
                   string
                  (
                  )
      )
      type
      (
        map
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
                       data
                      (
                      )
                  )
      )
      let
      (
        of_t
          (
            case
            (
              x
              x
            )
          )
      )
      let
      (
        to_t
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
    ssmap
      (
      Pexp_pack        SSMap
      :
          Ptyp_package MapT
          (
            with type key
               string
              (
              )
            with type data
               string
              (
              )
            with type map
               SSMap.map
              (
              )
          )
            )
  )
  let
  (
    ssmap
      (
      Pexp_pack        struct
        (
          include
          (
            SSMap
          )
        )
      :
          Ptyp_package MapT
          (
            with type key
               string
              (
              )
            with type data
               string
              (
              )
            with type map
               SSMap.map
              (
              )
          )
            )
  )
  let
  (
    ssmap
      (
      let module S
      (
        struct
        (
          include
          (
            SSMap
          )
        )
      )
      in
      (
      Pexp_pack        S
      )
      :
          Ptyp_package MapT
          (
            with type key
               string
              (
              )
            with type data
               string
              (
              )
            with type map
               SSMap.map
              (
              )
          )
            )
  )
  let
  (
    ssmap
      (
      Pexp_pack        SSMap
      :
          Ptyp_package MapT
          (
            with type key
              Ptyp_any
            with type data
              Ptyp_any
            with type map
              Ptyp_any
          )
            )
  )
  let
  (
    ssmap
      (
      Pexp_pack        SSMap
      :
           map
          (
              Ptyp_any
              Ptyp_any
              Ptyp_any
          )
            )
  )
  add
  (
      ssmap
  )
)

