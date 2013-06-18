(
  class
  (
      params =
          (
          )
      class name = point
      class expr =
          fun
          label=""
                    x_init
            class_structure
              (
                Pcf_val "x" Mutable Fresh ([3,29+2]..[3,29+24])
                  x_init
                method get_x
                  x
                                  method move
                  (
                    case
                    (
                      d
                      Pexp_setinstvar "x"
                      +
                      (
                          x
                          d
                      )
                    )
                  )
                                )
  )
  let
  (
    p
      new point
      (
          7
      )
  )
  send get_x
  (
    p
  )
  send move
  (
    p
  )
  (
      3
  )
  send get_x
  (
    p
  )
  let
  (
    q
      Oo.copy
      (
          p
      )
  )
  sequence
  (
    send move
    (
      q
    )
    (
        7
    )
  ;
    (
      send get_x
      (
        p
      )
      send get_x
      (
        q
      )
    )
  )
  class
  (
      params =
          (
          )
      class name = color_point
      class expr =
          fun
          label=""
                    x
            fun
            label=""
                        c
               string
              (
              )
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr point
                        (
                        )
                      (
                          x
                      )
                                      Pcf_val "c" Immutable Fresh ([20,275+2]..[20,275+11])
                    c
                  method color
                    c
                                    )
  )
  let
  (
    p'
      new color_point
      (
          5
          "red"
      )
  )
  (
    send get_x
    (
      p'
    )
    send color
    (
      p'
    )
  )
  let
  (
    l
      ::
        (
          p
          ::
            (
              (
              p'
              :
                                 point
                  (
                  )
              )
              []
                          )
        )
  )
  let
  (
    get_x
      (
        case
        (
          p
          send get_x
          (
            p
          )
        )
      )
  )
  let
  (
    set_x
      (
        case
        (
          p
          send set_x
          (
            p
          )
        )
      )
  )
  List.map
  (
      get_x
      l
  )
  class
  (
      params =
          (
          )
      class name = ref
      class expr =
          fun
          label=""
                    x_init
            class_structure
              (
                Pcf_val "x" Mutable Fresh ([35,495+2]..[35,495+24])
                  x_init
                method get
                  x
                                  method set
                  (
                    case
                    (
                      y
                      Pexp_setinstvar "x"
                      y
                    )
                  )
                                )
  )
  class
  (
      params =
          (
          )
      class name = ref
      class expr =
          fun
          label=""
                    x_init
             int
            (
            )
            class_structure
              (
                Pcf_val "x" Mutable Fresh ([41,600+2]..[41,600+24])
                  x_init
                method get
                  x
                                  method set
                  (
                    case
                    (
                      y
                      Pexp_setinstvar "x"
                      y
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
      class name = ref
      class expr =
          fun
          label=""
                    x_init
            class_structure
              (
                Pcf_val "x" Mutable Fresh ([47,704+2]..[47,704+31])
                  (
                  x_init
                  :
                      a
                                    )
                method get
                  x
                                  method set
                  (
                    case
                    (
                      y
                      Pexp_setinstvar "x"
                      y
                    )
                  )
                                )
  )
  let
  (
    (
      r
        new ref
        (
            1
        )
    )
  in
    sequence
    (
      send set
      (
        r
      )
      (
          2
      )
    ;
      send get
      (
        r
      )
    )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = circle
      class expr =
          fun
          label=""
                    c
            a
            class_structure
              (
                Pcf_val "center" Mutable Fresh ([55,861+2]..[55,861+24])
                  c
                method center
                  center
                                  method set_center
                  (
                    case
                    (
                      c
                      Pexp_setinstvar "center"
                      c
                    )
                  )
                                  method move
                  (
                  send move
                  (
                    center
                  )
                  :
                      arrow
                      
                         int
                        (
                        )
                         unit
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
      class name = circle
      class expr =
          fun
          label=""
                    c
            a
            class_structure
              (
                Pcf_constr ([62,1034+2]..[62,1034+24])
                    a
                    Ptyp_class point
                    (
                    )
                    (
                    )
                Pcf_val "center" Mutable Fresh ([63,1059+2]..[63,1059+24])
                  c
                method center
                  center
                                  method set_center
                  (
                    case
                    (
                      c
                      Pexp_setinstvar "center"
                      c
                    )
                  )
                                  method move
                  send move
                  (
                    center
                  )
                                )
  )
  let
  (
    (
      c
      c'
    )
      (
        new circle
        (
            p
        )
        new circle
        (
            p'
        )
      )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = color_circle
      class expr =
          fun
          label=""
                    c
            class_structure
              (
                Pcf_constr ([72,1262+2]..[72,1262+30])
                    a
                    Ptyp_class color_point
                    (
                    )
                    (
                    )
                Pcf_inher Fresh
                    Pcl_apply
                      constr circle
                      (
                          a
                      )
                    (
                        c
                    )
                                  method color
                  send color
                  (
                    center
                  )
                                )
  )
  let
  (
    c''
      new color_circle
      (
          p
      )
  )
  let
  (
    c''
      new color_circle
      (
          p'
      )
  )
  (
  c''
  :
         circle
      (
           color_point
          (
          )
      )
  )
  (
  c''
  :
         circle
      (
           point
          (
          )
      )
  )
  (
    case
    (
      x
      (
      x
      :
           color_circle
          (
               color_point
              (
              )
          )
           circle
          (
               point
              (
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
      class name = printable_point
      class expr =
          fun
          label=""
                    y
            class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr point
                      (
                      )
                    (
                        y
                    )
                                  method print
                  print_int
                  (
                      send get_x
                      (
                        s
                      )
                  )
                                )
  )
  let
  (
    p
      new printable_point
      (
          7
      )
  )
  send print
  (
    p
  )
  class
  (
      params =
          (
          )
      class name = printable_color_point
      class expr =
          fun
          label=""
                    y
            fun
            label=""
                        c
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr color_point
                        (
                        )
                      (
                          y
                          c
                      )
                                      Pcf_inher Fresh
                      Pcl_apply
                        constr printable_point
                        (
                        )
                      (
                          y
                      )
                      "super"
                  method print
                    sequence
                    (
                      print_string
                      (
                          "("
                      )
                    ;
                      sequence
                      (
                        send print
                        (
                          super
                        )
                      ;
                        sequence
                        (
                          print_string
                          (
                              ", "
                          )
                        ;
                          sequence
                          (
                            print_string
                            (
                                send color
                                (
                                  self
                                )
                            )
                          ;
                            print_string
                            (
                                ")"
                            )
                          )
                        )
                      )
                    )
                                    )
  )
  let
  (
    p'
      new printable_color_point
      (
          7
          "red"
      )
  )
  send print
  (
    p'
  )
  class
  (
      params =
          (
          )
      class name = functional_point
      class expr =
          fun
          label=""
                    y
            class_structure
              (
                Pcf_val "x" Immutable Fresh ([107,2039+2]..[107,2039+11])
                  y
                method get_x
                  x
                                  method move
                  (
                    case
                    (
                      d
                      Pexp_override
                      (
                        <override> "x"
                          +
                          (
                              x
                              d
                          )
                      )
                    )
                  )
                                )
  )
  let
  (
    p
      new functional_point
      (
          7
      )
  )
  send get_x
  (
    p
  )
  send get_x
  (
    send move
    (
      p
    )
    (
        3
    )
  )
  send get_x
  (
    p
  )
  (
    case
    (
      x
      (
      x
      :
                 functional_point
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
      class name = lst
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_virt "null" Public ([123,2334+2]..[123,2334+28])
                    poly
                    
                       bool
                      (
                      )
                Pcf_virt "hd" Public ([124,2363+2]..[124,2363+24])
                    poly
                    
                      a
                Pcf_virt "tl" Public ([125,2388+2]..[125,2388+28])
                    poly
                    
                       lst
                      (
                          a
                      )
                method map
                  (
                    case
                    (
                      f
                      (
                      ifthenelse
                      (
                        if
                        (
                          send null
                          (
                            self
                          )
                        )
                        then
                        (
                          new nil
                          (
                              ()
                                                        )
                        )
                        else
                        (
                            new cons
                            (
                                f
                                (
                                    send hd
                                    (
                                      self
                                    )
                                )
                                send map
                                (
                                  send tl
                                  (
                                    self
                                  )
                                )
                                (
                                    f
                                )
                            )
                        )
                      )
                      :
                           lst
                          (
                              a
                          )
                                            )
                    )
                  )
                                  method iter
                  (
                    case
                    (
                      f
                        arrow
                        
                          a
                           unit
                          (
                          )
                      ifthenelse
                      (
                        if
                        (
                          send null
                          (
                            self
                          )
                        )
                        then
                        (
                          ()
                                                  )
                        else
                        (
                            sequence
                            (
                              f
                              (
                                  send hd
                                  (
                                    self
                                  )
                              )
                            ;
                              send iter
                              (
                                send tl
                                (
                                  self
                                )
                              )
                              (
                                  f
                              )
                            )
                        )
                      )
                    )
                  )
                                  method print
                  (
                    case
                    (
                      f
                        arrow
                        
                          a
                           unit
                          (
                          )
                      sequence
                      (
                        print_string
                        (
                            "("
                        )
                      ;
                        sequence
                        (
                          send iter
                          (
                            self
                          )
                          (
                              (
                                case
                                (
                                  x
                                  sequence
                                  (
                                    f
                                    (
                                        x
                                    )
                                  ;
                                    print_string
                                    (
                                        "::"
                                    )
                                  )
                                )
                              )
                          )
                        ;
                          sequence
                          (
                            print_string
                            (
                                "[]"
                            )
                          ;
                            print_string
                            (
                                ")"
                            )
                          )
                        )
                      )
                    )
                  )
                                )
      params =
          (
            "a"
          )
      class name = nil
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr lst
                      (
                          a
                      )
                    (
                        ()
                                            )
                                  method null
                  true
                                                    method hd
                  failwith
                  (
                      "hd"
                  )
                                  method tl
                  failwith
                  (
                      "tl"
                  )
                                )
      params =
          (
            "a"
          )
      class name = cons
      class expr =
          fun
          label=""
                    h
            fun
            label=""
                        t
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr lst
                        (
                            a
                        )
                      (
                          ()
                                                )
                                      Pcf_val "h" Immutable Fresh ([150,2997+2]..[150,2997+11])
                    h
                  Pcf_val "t" Immutable Fresh ([150,2997+12]..[150,2997+21])
                    t
                  method null
                    false
                                                          method hd
                    h
                                      method tl
                    t
                                    )
  )
  let
  (
    l1
      new cons
      (
          3
          new cons
          (
              10
              new nil
              (
                  ()
                                )
          )
      )
  )
  send print
  (
    l1
  )
  (
      print_int
  )
  let
  (
    l2
      send map
      (
        l1
      )
      (
          (
            case
            (
              x
              +
              (
                  x
                  1
              )
            )
          )
      )
  )
  send print
  (
    l2
  )
  (
      print_int
  )
  let
  (
    map_list
      (
        case
        (
          f
          (
            case
            (
              x
                 lst
                (
                    a
                )
              ifthenelse
              (
                if
                (
                  send null
                  (
                    x
                  )
                )
                then
                (
                  new nil
                  (
                      ()
                                        )
                )
                else
                (
                    new cons
                    (
                        f
                        (
                            send hd
                            (
                              x
                            )
                        )
                        map_list
                        (
                            f
                            send tl
                            (
                              x
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
    p1
      map_list
      (
          (
            case
            (
              x
              new printable_color_point
              (
                  x
                  "red"
              )
            )
          )
          l1
      )
  )
  send print
  (
    p1
  )
  (
      (
        case
        (
          x
          send print
          (
            x
          )
        )
      )
  )
  class
  (
      params =
          (
          )
      class name = comparable
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_virt "leq" Public ([173,3539+2]..[173,3539+33])
                    poly
                    
                      arrow
                      
                        a
                         bool
                        (
                        )
              )
  )
  class
  (
      params =
          (
          )
      class name = int_comparable
      class expr =
          fun
          label=""
                    x
             int
            (
            )
            class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr comparable
                      (
                      )
                    (
                        ()
                                            )
                                  Pcf_val "x" Immutable Fresh ([178,3646+2]..[178,3646+11])
                  x
                method x
                  x
                                  method leq
                  (
                    case
                    (
                      p
                      <=
                      (
                          x
                          send x
                          (
                            p
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
          )
      class name = int_comparable2
      class expr =
          fun
          label=""
                    xi
            class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr int_comparable
                      (
                      )
                    (
                        xi
                    )
                                  Pcf_val "x'" Mutable Fresh ([185,3768+2]..[185,3768+21])
                  xi
                method set_x
                  (
                    case
                    (
                      y
                      Pexp_setinstvar "x'"
                      y
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
      class name = sorted_list
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_constr ([190,3859+2]..[190,3859+29])
                    a
                    Ptyp_class comparable
                    (
                    )
                    (
                    )
                Pcf_val "l" Mutable Fresh ([191,3889+2]..[191,3889+32])
                  (
                  []
                                    :
                       list
                      (
                          a
                      )
                                    )
                method add
                  (
                    case
                    (
                      x
                      let
                      (
                        (
                          insert
                            (
                              case
                              (
                                []
                                                                ::
                                  (
                                    x
                                    []
                                                                      )
                              )
                              case
                              (
                                alias l'
                                (
                                  ::
                                    (
                                      a
                                      l
                                    )
                                )
                                ifthenelse
                                (
                                  if
                                  (
                                    send leq
                                    (
                                      a
                                    )
                                    (
                                        x
                                    )
                                  )
                                  then
                                  (
                                    ::
                                      (
                                        a
                                        insert
                                        (
                                            l
                                        )
                                      )
                                  )
                                  else
                                  (
                                      ::
                                        (
                                          x
                                          l'
                                        )
                                  )
                                )
                              )
                            )
                        )
                      in
                        Pexp_setinstvar "l"
                        insert
                        (
                            l
                        )
                      )
                    )
                  )
                                  method hd
                  List.hd
                  (
                      l
                  )
                                )
  )
  let
  (
    l
      new sorted_list
      (
          ()
                )
  )
  let
  (
    c
      new int_comparable
      (
          10
      )
  )
  send add
  (
    l
  )
  (
      c
  )
  let
  (
    c2
      new int_comparable2
      (
          15
      )
  )
  send add
  (
    l
  )
  (
      (
      c2
      :
                 int_comparable
          (
          )
      )
  )
  send add
  (
    new sorted_list
    (
        ()
            )
  )
  (
      c2
  )
  class
  (
      params =
          (
          )
      class name = int_comparable3
      class expr =
          fun
          label=""
                    x
             int
            (
            )
            class_structure
              (
                Pcf_val "x" Mutable Fresh ([211,4379+2]..[211,4379+19])
                  x
                method leq
                  (
                    case
                    (
                      y
                         int_comparable
                        (
                        )
                      <
                      (
                          x
                          send x
                          (
                            y
                          )
                      )
                    )
                  )
                                  method x
                  x
                                  method setx
                  (
                    case
                    (
                      y
                      Pexp_setinstvar "x"
                      y
                    )
                  )
                                )
  )
  let
  (
    c3
      new int_comparable3
      (
          15
      )
  )
  send add
  (
    l
  )
  (
      (
      c3
      :
                 int_comparable
          (
          )
      )
  )
  send add
  (
    new sorted_list
    (
        ()
            )
  )
  (
      c3
  )
  let
  (
    sort
      (
        case
        (
          l
             list
            (
                Ptyp_class comparable
                (
                )
                (
                )
            )
          Sort.list
          (
              (
                case
                (
                  x
                  send leq
                  (
                    x
                  )
                )
              )
              l
          )
        )
      )
  )
  let
  (
    pr
      (
        case
        (
          l
          sequence
          (
            List.map
            (
                (
                  case
                  (
                    c
                    sequence
                    (
                      print_int
                      (
                          send x
                          (
                            c
                          )
                      )
                    ;
                      print_string
                      (
                          " "
                      )
                    )
                  )
                )
                l
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
  let
  (
    l
      ::
        (
          new int_comparable
          (
              5
          )
          ::
            (
              (
              new int_comparable3
              (
                  2
              )
              :
                                 int_comparable
                  (
                  )
              )
              ::
                (
                  new int_comparable
                  (
                      4
                  )
                  []
                                  )
            )
        )
  )
  pr
  (
      l
  )
  pr
  (
      sort
      (
          l
      )
  )
  let
  (
    l
      ::
        (
          new int_comparable2
          (
              2
          )
          ::
            (
              new int_comparable2
              (
                  0
              )
              []
                          )
        )
  )
  pr
  (
      l
  )
  pr
  (
      sort
      (
          l
      )
  )
  let
  (
    min
      (
        case
        (
          x
            Ptyp_class comparable
            (
            )
            (
            )
          (
            case
            (
              y
              ifthenelse
              (
                if
                (
                  send leq
                  (
                    x
                  )
                  (
                      y
                  )
                )
                then
                (
                  x
                )
                else
                (
                    y
                )
              )
            )
          )
        )
      )
  )
  send x
  (
    min
    (
        new int_comparable
        (
            7
        )
        new int_comparable
        (
            11
        )
    )
  )
  send x
  (
    min
    (
        new int_comparable2
        (
            5
        )
        new int_comparable2
        (
            3
        )
    )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = link
      class expr =
          fun
          label=""
                    x
            a
            class_structure
              (
                Pcf_val "x" Mutable Fresh ([242,5288+2]..[242,5288+19])
                  x
                Pcf_val "next" Mutable Fresh ([243,5308+2]..[243,5308+39])
                  (
                  None
                                    :
                       option
                      (
                          b
                      )
                                    )
                method x
                  x
                                  method next
                  next
                                  method set_x
                  (
                    case
                    (
                      y
                      Pexp_setinstvar "x"
                      y
                    )
                  )
                                  method set_next
                  (
                    case
                    (
                      l
                      Pexp_setinstvar "next"
                      l
                    )
                  )
                                  method append
                  (
                    case
                    (
                      l
                      match
                      next
                      (
                        case
                        (
                          None
                                                    send set_next
                          (
                            self
                          )
                          (
                              l
                          )
                        )
                        case
                        (
                          Some
                            l'
                          send append
                          (
                            l'
                          )
                          (
                              l
                          )
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
      class name = double_link
      class expr =
          fun
          label=""
                    x
            class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr link
                      (
                          a
                      )
                    (
                        x
                    )
                                  Pcf_val "prev" Mutable Fresh ([258,5631+2]..[258,5631+25])
                  None
                                  method prev
                  prev
                                  method set_next
                  (
                    case
                    (
                      l
                      sequence
                      (
                        Pexp_setinstvar "next"
                        l
                      ;
                        match
                        l
                        (
                          case
                          (
                            Some
                              l
                            send set_prev
                            (
                              l
                            )
                            (
                                Some
                                  self
                            )
                          )
                          case
                          (
                            None
                                                        ()
                                                      )
                        )
                      )
                    )
                  )
                                  method set_prev
                  (
                    case
                    (
                      l
                      Pexp_setinstvar "prev"
                      l
                    )
                  )
                                )
  )
  let
  (
    fold_right
      (
        case
        (
          f
          (
            case
            (
              l
                 option
                (
                    Ptyp_class link
                    (
                        a
                    )
                    (
                    )
                )
              (
                case
                (
                  accu
                  match
                  l
                  (
                    case
                    (
                      None
                                            accu
                    )
                    case
                    (
                      Some
                        l
                      f
                      (
                          send x
                          (
                            l
                          )
                          fold_right
                          (
                              f
                              send next
                              (
                                l
                              )
                              accu
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
  class
  (
      params =
          (
          )
      class name = calculator
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_val "arg" Mutable Fresh ([275,6074+2]..[275,6074+22])
                  0.
                Pcf_val "acc" Mutable Fresh ([276,6097+2]..[276,6097+22])
                  0.
                Pcf_val "equals" Mutable Fresh ([277,6120+2]..[277,6120+42])
                  (
                    case
                    (
                      s
                      send arg
                      (
                        s
                      )
                    )
                  )
                method arg
                  arg
                                  method acc
                  acc
                                  method enter
                  (
                    case
                    (
                      n
                      sequence
                      (
                        Pexp_setinstvar "arg"
                        n
                      ;
                        self
                      )
                    )
                  )
                                  method add
                  sequence
                  (
                    Pexp_setinstvar "acc"
                    equals
                    (
                        self
                    )
                  ;
                    sequence
                    (
                      Pexp_setinstvar "equals"
                      (
                        case
                        (
                          s
                          +.
                          (
                              send acc
                              (
                                s
                              )
                              send arg
                              (
                                s
                              )
                          )
                        )
                      )
                    ;
                      self
                    )
                  )
                                  method sub
                  sequence
                  (
                    Pexp_setinstvar "acc"
                    equals
                    (
                        self
                    )
                  ;
                    sequence
                    (
                      Pexp_setinstvar "equals"
                      (
                        case
                        (
                          s
                          -.
                          (
                              send acc
                              (
                                s
                              )
                              send arg
                              (
                                s
                              )
                          )
                        )
                      )
                    ;
                      self
                    )
                  )
                                  method equals
                  equals
                  (
                      self
                  )
                                )
  )
  send equals
  (
    send enter
    (
      new calculator
      (
          ()
                )
    )
    (
        5.
    )
  )
  send equals
  (
    send enter
    (
      send sub
      (
        send enter
        (
          new calculator
          (
              ()
                        )
        )
        (
            5.
        )
      )
    )
    (
        3.5
    )
  )
  send equals
  (
    send add
    (
      send add
      (
        send enter
        (
          new calculator
          (
              ()
                        )
        )
        (
            5.
        )
      )
    )
  )
  class
  (
      params =
          (
          )
      class name = calculator
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_val "arg" Mutable Fresh ([297,6641+2]..[297,6641+22])
                  0.
                Pcf_val "acc" Mutable Fresh ([298,6664+2]..[298,6664+22])
                  0.
                Pcf_val "equals" Mutable Fresh ([299,6687+2]..[299,6687+42])
                  (
                    case
                    (
                      s
                      send arg
                      (
                        s
                      )
                    )
                  )
                method arg
                  arg
                                  method acc
                  acc
                                  method enter
                  (
                    case
                    (
                      n
                      sequence
                      (
                        Pexp_setinstvar "arg"
                        n
                      ;
                        self
                      )
                    )
                  )
                                  method add
                  Pexp_override
                  (
                    <override> "acc"
                      equals
                      (
                          self
                      )
                    <override> "equals"
                      (
                        case
                        (
                          s
                          +.
                          (
                              send acc
                              (
                                s
                              )
                              send arg
                              (
                                s
                              )
                          )
                        )
                      )
                  )
                                  method sub
                  Pexp_override
                  (
                    <override> "acc"
                      equals
                      (
                          self
                      )
                    <override> "equals"
                      (
                        case
                        (
                          s
                          -.
                          (
                              send acc
                              (
                                s
                              )
                              send arg
                              (
                                s
                              )
                          )
                        )
                      )
                  )
                                  method equals
                  equals
                  (
                      self
                  )
                                )
  )
  send equals
  (
    send enter
    (
      new calculator
      (
          ()
                )
    )
    (
        5.
    )
  )
  send equals
  (
    send enter
    (
      send sub
      (
        send enter
        (
          new calculator
          (
              ()
                        )
        )
        (
            5.
        )
      )
    )
    (
        3.5
    )
  )
  send equals
  (
    send add
    (
      send add
      (
        send enter
        (
          new calculator
          (
              ()
                        )
        )
        (
            5.
        )
      )
    )
  )
  class
  (
      params =
          (
          )
      class name = calculator
      class expr =
          fun
          label=""
                    arg
            fun
            label=""
                        acc
              class_structure
                (
                  Pcf_val "arg" Immutable Fresh ([313,7181+2]..[313,7181+15])
                    arg
                  Pcf_val "acc" Immutable Fresh ([314,7197+2]..[314,7197+15])
                    acc
                  method enter
                    (
                      case
                      (
                        n
                        new calculator
                        (
                            n
                            acc
                        )
                      )
                    )
                                      method add
                    new calculator_add
                    (
                        arg
                        send equals
                        (
                          self
                        )
                    )
                                      method sub
                    new calculator_sub
                    (
                        arg
                        send equals
                        (
                          self
                        )
                    )
                                      method equals
                    arg
                                    )
      params =
          (
          )
      class name = calculator_add
      class expr =
          fun
          label=""
                    arg
            fun
            label=""
                        acc
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr calculator
                        (
                        )
                      (
                          arg
                          acc
                      )
                                      method enter
                    (
                      case
                      (
                        n
                        new calculator_add
                        (
                            n
                            acc
                        )
                      )
                    )
                                      method equals
                    +.
                    (
                        acc
                        arg
                    )
                                    )
      params =
          (
          )
      class name = calculator_sub
      class expr =
          fun
          label=""
                    arg
            fun
            label=""
                        acc
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr calculator
                        (
                        )
                      (
                          arg
                          acc
                      )
                                      method enter
                    (
                      case
                      (
                        n
                        new calculator_sub
                        (
                            n
                            acc
                        )
                      )
                    )
                                      method equals
                    -.
                    (
                        acc
                        arg
                    )
                                    )
  )
  let
  (
    calculator
      new calculator
      (
          0.
          0.
      )
  )
  send equals
  (
    send enter
    (
      calculator
    )
    (
        5.
    )
  )
  send equals
  (
    send enter
    (
      send sub
      (
        send enter
        (
          calculator
        )
        (
            5.
        )
      )
    )
    (
        3.5
    )
  )
  send equals
  (
    send add
    (
      send add
      (
        send enter
        (
          calculator
        )
        (
            5.
        )
      )
    )
  )
)

