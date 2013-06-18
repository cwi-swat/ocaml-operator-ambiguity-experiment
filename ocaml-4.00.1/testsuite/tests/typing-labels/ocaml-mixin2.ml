(
  open StdLabels
  open MoreLabels
  module Subst
      Map.Make
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
                
                     string
                    (
                    )
        )
        let
        (
          compare
            compare
        )
      )
    )
  module Names
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
                
                     string
                    (
                    )
        )
        let
        (
          compare
            compare
        )
      )
    )
  let
  (
    lazy_fix
      (
        case
        (
          make
          let
          (
            (
              obj
                (
                  case
                  (
                    ()
                                        make
                    (
                        (
                        Pexp_lazy                        obj
                        (
                            ()
                                                    )
                        :
                             Lazy.t
                            (
                                Ptyp_any
                            )
                                                )
                    )
                  )
                )
            )
          in
            obj
            (
                ()
                            )
          )
        )
      )
  )
  let
  (
    !!
      Lazy.force
  )
  class_type
  (
    class_type_declaration ([23,531+11]..[28,671+5])
      pci_virt = Concrete
      pci_params =
          (
            "a"
            "b"
          )
      pci_name = "ops"
      pci_expr =
        class_type ([24,557+2]..[28,671+5])
          Pcty_signature
          class_signature
              Ptyp_any
            (
              Pctf_meth "free" Public ([25,566+4]..[25,566+31])
                  poly
                  
                    arrow
                    
                      b
                       Names.t
                      (
                      )
              Pctf_meth "subst" Public ([26,598+4]..[26,598+45])
                  poly
                  
                    arrow
                    sub
                       Subst.t
                      (
                          a
                      )
                      arrow
                      
                        b
                        a
              Pctf_meth "eval" Public ([27,644+4]..[27,644+26])
                  poly
                  
                    arrow
                    
                      b
                      a
            )
  )
  type
  (
    var
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
                Rtag "Var" false
                  (
                       string
                      (
                      )
                  )
              )
                )
  class
  (
      params =
          (
            "a"
          )
      class name = var_ops
      class expr =
          class_structure
            (
              Pcf_constr ([35,806+2]..[35,806+25])
                  a
                  Ptyp_variant closed=false
                  (
                    Rinherit
                         var
                        (
                        )
                  )
                                method subst
                (
                  case
                  (
                    sub
                    (
                      case
                      (
                        Ppat_alias "x"
                        Ppat_variant "Var"
                          s
                        try
                        Subst.find
                        (
                            s
                            sub
                        )
                        (
                          case
                          (
                            Not_found
                                                        x
                          )
                        )
                      )
                    )
                  )
                )
                              method free
                (
                  case
                  (
                    Ppat_variant "Var"
                      s
                    Names.singleton
                    (
                        s
                    )
                  )
                )
                              method eval
                (
                  case
                  (
                    Ppat_alias "v"
                    pat_type                    var
                    v
                  )
                )
                            )
  )
  type
  (
    lambda
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
                Rtag "Var" false
                  (
                       string
                      (
                      )
                  )
                Rtag "Abs" false
                  (
                      tuple
                      (
                           string
                          (
                          )
                          a
                      )
                  )
                Rtag "App" false
                  (
                      tuple
                      (
                          a
                          a
                      )
                  )
              )
                )
  let
  (
    next_id
      let
      (
        (
          current
            ref
            (
                3
            )
        )
      in
        (
          case
          (
            ()
                        sequence
            (
              incr
              (
                  current
              )
            ;
              !
              (
                  current
              )
            )
          )
        )
      )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = lambda_ops
      class expr =
          fun
          label=""
                    ops
             Lazy.t
            (
                Ptyp_class ops
                (
                    a
                    a
                )
                (
                )
            )
            let Nonrec
            (
              var
                (
                new var_ops
                :
                     var_ops
                    (
                        a
                    )
                                )
              free
                Pexp_lazy                send free
                (
                  !!
                  (
                      ops
                  )
                )
              subst
                Pexp_lazy                send subst
                (
                  !!
                  (
                      ops
                  )
                )
              eval
                Pexp_lazy                send eval
                (
                  !!
                  (
                      ops
                  )
                )
            )
              class_structure
                (
                  Pcf_constr ([57,1439+4]..[57,1439+33])
                      a
                      Ptyp_variant closed=false
                      (
                        Rinherit
                             lambda
                            (
                                a
                            )
                      )
                                        method free
                    (
                      case
                      (
                        Ppat_alias "x"
                        pat_type                        var
                        send free
                        (
                          var
                        )
                        (
                            x
                        )
                      )
                      case
                      (
                        Ppat_variant "Abs"
                          (
                            s
                            t
                          )
                        Names.remove
                        (
                            s
                            !!
                            (
                                free
                            )
                            (
                                t
                            )
                        )
                      )
                      case
                      (
                        Ppat_variant "App"
                          (
                            t1
                            t2
                          )
                        Names.union
                        (
                            !!
                            (
                                free
                            )
                            (
                                t1
                            )
                            !!
                            (
                                free
                            )
                            (
                                t2
                            )
                        )
                      )
                    )
                                      method map
                    (
                      case
                      (
                        f
                        (
                          case
                          (
                            Ppat_alias "x"
                            pat_type                            var
                            x
                          )
                          case
                          (
                            Ppat_alias "l"
                            Ppat_variant "Abs"
                              (
                                s
                                t
                              )
                            let
                            (
                              (
                                t'
                                  f
                                  (
                                      t
                                  )
                              )
                            in
                              ifthenelse
                              (
                                if
                                (
                                  ==
                                  (
                                      t
                                      t'
                                  )
                                )
                                then
                                (
                                  l
                                )
                                else
                                (
                                    Pexp_variant "Abs"
                                      (
                                        s
                                        t'
                                      )
                                )
                              )
                            )
                          )
                          case
                          (
                            Ppat_alias "l"
                            Ppat_variant "App"
                              (
                                t1
                                t2
                              )
                            let
                            (
                              (
                                t'1
                                  f
                                  (
                                      t1
                                  )
                                t'2
                                  f
                                  (
                                      t2
                                  )
                              )
                            in
                              ifthenelse
                              (
                                if
                                (
                                  &&
                                  (
                                      ==
                                      (
                                          t'1
                                          t1
                                      )
                                      ==
                                      (
                                          t'2
                                          t2
                                      )
                                  )
                                )
                                then
                                (
                                  l
                                )
                                else
                                (
                                    Pexp_variant "App"
                                      (
                                        t'1
                                        t'2
                                      )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                                      method subst
                    (
                      case
                      (
                        sub
                        (
                          case
                          (
                            Ppat_alias "x"
                            pat_type                            var
                            send subst
                            (
                              var
                            )
                            (
                                sub
                                x
                            )
                          )
                          case
                          (
                            Ppat_alias "l"
                            Ppat_variant "Abs"
                              (
                                s
                                t
                              )
                            let
                            (
                              (
                                used
                                  !!
                                  (
                                      free
                                  )
                                  (
                                      t
                                  )
                              )
                            in
                              let
                              (
                                (
                                  used_expr
                                    Subst.fold
                                    (
                                        sub
                                        []
                                                                                (
                                          case
                                          (
                                            key
                                            (
                                              case
                                              (
                                                data
                                                (
                                                  case
                                                  (
                                                    acc
                                                    ifthenelse
                                                    (
                                                      if
                                                      (
                                                        Names.mem
                                                        (
                                                            s
                                                            used
                                                        )
                                                      )
                                                      then
                                                      (
                                                        ::
                                                          (
                                                            data
                                                            acc
                                                          )
                                                      )
                                                      else
                                                      (
                                                          acc
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
                              in
                                ifthenelse
                                (
                                  if
                                  (
                                    List.exists
                                    (
                                        used_expr
                                        (
                                          case
                                          (
                                            t
                                            Names.mem
                                            (
                                                s
                                                !!
                                                (
                                                    free
                                                )
                                                (
                                                    t
                                                )
                                            )
                                          )
                                        )
                                    )
                                  )
                                  then
                                  (
                                    let
                                    (
                                      (
                                        name
                                          ^
                                          (
                                              s
                                              string_of_int
                                              (
                                                  next_id
                                                  (
                                                      ()
                                                                                                        )
                                              )
                                          )
                                      )
                                    in
                                      Pexp_variant "Abs"
                                        (
                                          name
                                          !!
                                          (
                                              subst
                                          )
                                          (
                                              Subst.add
                                              (
                                                  s
                                                  Pexp_variant "Var"
                                                    name
                                                  sub
                                              )
                                              t
                                          )
                                        )
                                    )
                                  )
                                  else
                                  (
                                      send map
                                      (
                                        self
                                      )
                                      (
                                          !!
                                          (
                                              subst
                                          )
                                          (
                                              Subst.remove
                                              (
                                                  s
                                                  sub
                                              )
                                          )
                                          l
                                      )
                                  )
                                )
                              )
                            )
                          )
                          case
                          (
                            Ppat_alias "l"
                            Ppat_variant "App"
                              _
                            send map
                            (
                              self
                            )
                            (
                                !!
                                (
                                    subst
                                )
                                (
                                    sub
                                )
                                l
                            )
                          )
                        )
                      )
                    )
                                      method eval
                    (
                      case
                      (
                        l
                        match
                        send map
                        (
                          self
                        )
                        (
                            !!
                            (
                                eval
                            )
                            l
                        )
                        (
                          case
                          (
                            Ppat_variant "App"
                              (
                                Ppat_variant "Abs"
                                  (
                                    s
                                    t1
                                  )
                                t2
                              )
                            !!
                            (
                                eval
                            )
                            (
                                !!
                                (
                                    subst
                                )
                                (
                                    Subst.add
                                    (
                                        s
                                        t2
                                        Subst.empty
                                    )
                                    t1
                                )
                            )
                          )
                          case
                          (
                            t
                            t
                          )
                        )
                      )
                    )
                                    )
  )
  let
  (
    lambda
      lazy_fix
      (
          new lambda_ops
      )
  )
  type
  (
    expr
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
                Rtag "Var" false
                  (
                       string
                      (
                      )
                  )
                Rtag "Num" false
                  (
                       int
                      (
                      )
                  )
                Rtag "Add" false
                  (
                      tuple
                      (
                          a
                          a
                      )
                  )
                Rtag "Neg" false
                  (
                      a
                  )
                Rtag "Mult" false
                  (
                      tuple
                      (
                          a
                          a
                      )
                  )
              )
                )
  class
  (
      params =
          (
            "a"
          )
      class name = expr_ops
      class expr =
          fun
          label=""
                    ops
             Lazy.t
            (
                Ptyp_class ops
                (
                    a
                    a
                )
                (
                )
            )
            let Nonrec
            (
              var
                (
                new var_ops
                :
                     var_ops
                    (
                        a
                    )
                                )
              free
                Pexp_lazy                send free
                (
                  !!
                  (
                      ops
                  )
                )
              subst
                Pexp_lazy                send subst
                (
                  !!
                  (
                      ops
                  )
                )
              eval
                Pexp_lazy                send eval
                (
                  !!
                  (
                      ops
                  )
                )
            )
              class_structure
                (
                  Pcf_constr ([112,3238+4]..[112,3238+31])
                      a
                      Ptyp_variant closed=false
                      (
                        Rinherit
                             expr
                            (
                                a
                            )
                      )
                                        method free
                    (
                      case
                      (
                        Ppat_alias "x"
                        pat_type                        var
                        send free
                        (
                          var
                        )
                        (
                            x
                        )
                      )
                      case
                      (
                        Ppat_variant "Num"
                          _
                        Names.empty
                      )
                      case
                      (
                        Ppat_variant "Add"
                          (
                            x
                            y
                          )
                        Names.union
                        (
                            !!
                            (
                                free
                            )
                            (
                                x
                            )
                            !!
                            (
                                free
                            )
                            (
                                y
                            )
                        )
                      )
                      case
                      (
                        Ppat_variant "Neg"
                          x
                        !!
                        (
                            free
                        )
                        (
                            x
                        )
                      )
                      case
                      (
                        Ppat_variant "Mult"
                          (
                            x
                            y
                          )
                        Names.union
                        (
                            !!
                            (
                                free
                            )
                            (
                                x
                            )
                            !!
                            (
                                free
                            )
                            (
                                y
                            )
                        )
                      )
                    )
                                      method map
                    (
                      case
                      (
                        f
                        (
                          case
                          (
                            Ppat_alias "x"
                            pat_type                            var
                            x
                          )
                          case
                          (
                            Ppat_alias "x"
                            Ppat_variant "Num"
                              _
                            x
                          )
                          case
                          (
                            Ppat_alias "e"
                            Ppat_variant "Add"
                              (
                                x
                                y
                              )
                            let
                            (
                              (
                                x'
                                  f
                                  (
                                      x
                                  )
                                y'
                                  f
                                  (
                                      y
                                  )
                              )
                            in
                              ifthenelse
                              (
                                if
                                (
                                  &&
                                  (
                                      ==
                                      (
                                          x
                                          x'
                                      )
                                      ==
                                      (
                                          y
                                          y'
                                      )
                                  )
                                )
                                then
                                (
                                  e
                                )
                                else
                                (
                                    Pexp_variant "Add"
                                      (
                                        x'
                                        y'
                                      )
                                )
                              )
                            )
                          )
                          case
                          (
                            Ppat_alias "e"
                            Ppat_variant "Neg"
                              x
                            let
                            (
                              (
                                x'
                                  f
                                  (
                                      x
                                  )
                              )
                            in
                              ifthenelse
                              (
                                if
                                (
                                  ==
                                  (
                                      x
                                      x'
                                  )
                                )
                                then
                                (
                                  e
                                )
                                else
                                (
                                    Pexp_variant "Neg"
                                      x'
                                )
                              )
                            )
                          )
                          case
                          (
                            Ppat_alias "e"
                            Ppat_variant "Mult"
                              (
                                x
                                y
                              )
                            let
                            (
                              (
                                x'
                                  f
                                  (
                                      x
                                  )
                                y'
                                  f
                                  (
                                      y
                                  )
                              )
                            in
                              ifthenelse
                              (
                                if
                                (
                                  &&
                                  (
                                      ==
                                      (
                                          x
                                          x'
                                      )
                                      ==
                                      (
                                          y
                                          y'
                                      )
                                  )
                                )
                                then
                                (
                                  e
                                )
                                else
                                (
                                    Pexp_variant "Mult"
                                      (
                                        x'
                                        y'
                                      )
                                )
                              )
                            )
                          )
                        )
                      )
                    )
                                      method subst
                    (
                      case
                      (
                        sub
                        (
                          case
                          (
                            Ppat_alias "x"
                            pat_type                            var
                            send subst
                            (
                              var
                            )
                            (
                                sub
                                x
                            )
                          )
                          case
                          (
                            Ppat_alias "e"
                            pat_type                            expr
                            send map
                            (
                              self
                            )
                            (
                                !!
                                (
                                    subst
                                )
                                (
                                    sub
                                )
                                e
                            )
                          )
                        )
                      )
                    )
                                      method eval
                    (
                      case
                      (
                        Ppat_alias "e"
                        pat_type                        expr
                        match
                        send map
                        (
                          self
                        )
                        (
                            !!
                            (
                                eval
                            )
                            e
                        )
                        (
                          case
                          (
                            Ppat_variant "Add"
                              (
                                Ppat_variant "Num"
                                  m
                                Ppat_variant "Num"
                                  n
                              )
                            Pexp_variant "Num"
                              +
                              (
                                  m
                                  n
                              )
                          )
                          case
                          (
                            Ppat_variant "Neg"
                              Ppat_variant "Num"
                                n
                            Pexp_variant "Num"
                              ~-
                              (
                                  n
                              )
                          )
                          case
                          (
                            Ppat_variant "Mult"
                              (
                                Ppat_variant "Num"
                                  m
                                Ppat_variant "Num"
                                  n
                              )
                            Pexp_variant "Num"
                              *
                              (
                                  m
                                  n
                              )
                          )
                          case
                          (
                            e
                            e
                          )
                        )
                      )
                    )
                                    )
  )
  let
  (
    expr
      lazy_fix
      (
          new expr_ops
      )
  )
  type
  (
    lexpr
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
                Rinherit
                     lambda
                    (
                        a
                    )
                Rinherit
                     expr
                    (
                        a
                    )
              )
                )
  class
  (
      params =
          (
            "a"
          )
      class name = lexpr_ops
      class expr =
          fun
          label=""
                    ops
             Lazy.t
            (
                Ptyp_class ops
                (
                    a
                    a
                )
                (
                )
            )
            let Nonrec
            (
              lambda
                new lambda_ops
                (
                    ops
                )
            )
              let Nonrec
              (
                expr
                  new expr_ops
                  (
                      ops
                  )
              )
                class_structure
                  (
                    Pcf_constr ([159,4589+4]..[159,4589+32])
                        a
                        Ptyp_variant closed=false
                        (
                          Rinherit
                               lexpr
                              (
                                  a
                              )
                        )
                                            method free
                      (
                        case
                        (
                          Ppat_alias "x"
                          pat_type                          lambda
                          send free
                          (
                            lambda
                          )
                          (
                              x
                          )
                        )
                        case
                        (
                          Ppat_alias "x"
                          pat_type                          expr
                          send free
                          (
                            expr
                          )
                          (
                              x
                          )
                        )
                      )
                                          method subst
                      (
                        case
                        (
                          sub
                          (
                            case
                            (
                              Ppat_alias "x"
                              pat_type                              lambda
                              send subst
                              (
                                lambda
                              )
                              (
                                  sub
                                  x
                              )
                            )
                            case
                            (
                              Ppat_alias "x"
                              pat_type                              expr
                              send subst
                              (
                                expr
                              )
                              (
                                  sub
                                  x
                              )
                            )
                          )
                        )
                      )
                                          method eval
                      (
                        case
                        (
                          Ppat_alias "x"
                          pat_type                          lambda
                          send eval
                          (
                            lambda
                          )
                          (
                              x
                          )
                        )
                        case
                        (
                          Ppat_alias "x"
                          pat_type                          expr
                          send eval
                          (
                            expr
                          )
                          (
                              x
                          )
                        )
                      )
                                        )
  )
  let
  (
    lexpr
      lazy_fix
      (
          new lexpr_ops
      )
  )
  let
  (
    print
      (
        case
        (
          Ppat_variant "Var"
            id
          print_string
          (
              id
          )
        )
        case
        (
          Ppat_variant "Abs"
            (
              id
              l
            )
          sequence
          (
            print_string
            (
                ^
                (
                    " "
                    ^
                    (
                        id
                        " . "
                    )
                )
            )
          ;
            print
            (
                l
            )
          )
        )
        case
        (
          Ppat_variant "App"
            (
              l1
              l2
            )
          sequence
          (
            print
            (
                l1
            )
          ;
            sequence
            (
              print_string
              (
                  " "
              )
            ;
              print
              (
                  l2
              )
            )
          )
        )
        case
        (
          Ppat_variant "Num"
            x
          print_int
          (
              x
          )
        )
        case
        (
          Ppat_variant "Add"
            (
              e1
              e2
            )
          sequence
          (
            print
            (
                e1
            )
          ;
            sequence
            (
              print_string
              (
                  " + "
              )
            ;
              print
              (
                  e2
              )
            )
          )
        )
        case
        (
          Ppat_variant "Neg"
            e
          sequence
          (
            print_string
            (
                "-"
            )
          ;
            print
            (
                e
            )
          )
        )
        case
        (
          Ppat_variant "Mult"
            (
              e1
              e2
            )
          sequence
          (
            print
            (
                e1
            )
          ;
            sequence
            (
              print_string
              (
                  " * "
              )
            ;
              print
              (
                  e2
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
          e1
            send eval
            (
              lambda
            )
            (
                Pexp_variant "App"
                  (
                    Pexp_variant "Abs"
                      (
                        "x"
                        Pexp_variant "Var"
                          "x"
                      )
                    Pexp_variant "Var"
                      "y"
                  )
            )
        )
      in
        let
        (
          (
            e2
              send eval
              (
                expr
              )
              (
                  Pexp_variant "Add"
                    (
                      Pexp_variant "Mult"
                        (
                          Pexp_variant "Num"
                            3
                          Pexp_variant "Neg"
                            Pexp_variant "Num"
                              2
                        )
                      Pexp_variant "Var"
                        "x"
                    )
              )
          )
        in
          let
          (
            (
              e3
                send eval
                (
                  lexpr
                )
                (
                    Pexp_variant "Add"
                      (
                        Pexp_variant "App"
                          (
                            Pexp_variant "Abs"
                              (
                                "x"
                                Pexp_variant "Mult"
                                  (
                                    Pexp_variant "Var"
                                      "x"
                                    Pexp_variant "Var"
                                      "x"
                                  )
                              )
                            Pexp_variant "Num"
                              2
                          )
                        Pexp_variant "Num"
                          5
                      )
                )
            )
          in
            sequence
            (
              print
              (
                  e1
              )
            ;
              sequence
              (
                print_newline
                (
                    ()
                                    )
              ;
                sequence
                (
                  print
                  (
                      e2
                  )
                ;
                  sequence
                  (
                    print_newline
                    (
                        ()
                                            )
                  ;
                    sequence
                    (
                      print
                      (
                          e3
                      )
                    ;
                      print_newline
                      (
                          ()
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

