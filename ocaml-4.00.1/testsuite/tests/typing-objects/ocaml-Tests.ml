(
  (
    case
    (
      x
        Ptyp_object
        (
          core_field_type ([2,38+11]..[2,38+18])
            Pfield "x"
              poly
              
                 int
                (
                )
        )
      (
        case
        (
          y
          (
            case
            (
              z
              (
                (
                y
                :
                                    a
                )
                (
                x
                :
                                    a
                )
                (
                z
                :
                                    a
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
            "a"
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method f
                  (
                  new c
                  (
                      ()
                                        )
                  :
                       c
                      (
                           int
                          (
                          )
                      )
                                    )
                                )
      params =
          (
            "a"
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                          a
                      )
                    (
                        ()
                                            )
                                )
  )
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
                    ()
                      class_structure
              (
                method f
                  (
                    case
                    (
                      x
                        a
                      ()
                                          )
                  )
                                )
      params =
          (
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                          a
                      )
                    (
                        ()
                                            )
                                )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
              )
      params =
          (
            "a"
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_constr ([24,658+2]..[24,658+20])
                    a
                    Ptyp_class c
                    (
                    )
                    (
                    )
                method f
                  (
                    case
                    (
                      x
                        Ptyp_class c
                        (
                        )
                        (
                        )
                      (
                      send x
                      (
                        x
                      )
                      :
                           int
                          (
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
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_constr ([32,887+2]..[32,887+21])
                    a
                     int
                    (
                    )
              )
      params =
          (
            "a"
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_constr ([34,936+2]..[34,936+23])
                    a
                    Ptyp_class c
                    (
                        b
                    )
                    (
                    )
              )
  )
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
                Pcf_constr ([41,1152+2]..[41,1152+20])
                    a
                    b
                method f
                  self
                                )
  )
  new c
  class
  (
      params =
          (
          )
      class name = x
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_virt "f" Public ([50,1353+2]..[50,1353+24])
                    poly
                    
                       int
                      (
                      )
              )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    x
            a
            Ptyp_object
            (
              core_field_type ([55,1474+29]..[55,1474+36])
                Pfield "f"
                  poly
                  
                     int
                    (
                    )
            )
            class_structure
              (
              )
      params =
          (
          )
      class name = d
      class expr =
          fun
          label=""
                    x
            class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                      )
                    (
                        x
                    )
                                  method g
                  true
                                                  )
  )
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
                    ()
                      class_structure
              (
                Pcf_constr ([63,1665+2]..[63,1665+21])
                    a
                     int
                    (
                    )
                method f
                  (
                    case
                    (
                      x
                      (
                      x
                      :
                           c
                          (
                               bool
                              (
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
            "b"
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_constr ([69,1781+2]..[69,1781+27])
                    a
                    arrow
                    
                       int
                      (
                      )
                      c
                Pcf_constr ([70,1809+2]..[70,1809+41])
                    b
                    tuple
                    (
                        a
                        Ptyp_object
                        (
                          core_field_type ([70,1809+24]..[70,1809+30])
                            Pfield "x"
                              poly
                              
                                b
                        )
                        c
                        d
                    )
                method f
                  (
                    case
                    (
                      x
                        a
                      (
                        case
                        (
                          y
                            b
                          ()
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
            "b"
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                          a
                          b
                      )
                    (
                        ()
                                            )
                                )
  )
  let
  (
    x
      ref
      (
          []
                )
  )
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
                    ()
                      class_structure
              (
                method f
                  (
                  x
                  :
                      a
                                    )
                                )
  )
  type
  (
    c
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_object
              (
                core_field_type ([84,2072+13]..[84,2072+21])
                  Pfield "f"
                    poly
                    
                       c
                      (
                          a
                      )
                core_field_type ([84,2072+23]..[84,2072+31])
                  Pfield "g"
                    poly
                    
                       d
                      (
                          a
                      )
              )
    d
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_object
              (
                core_field_type ([85,2105+12]..[85,2105+21])
                  Pfield "f"
                    poly
                    
                       c
                      (
                           int
                          (
                          )
                      )
              )
  )
  type
  (
    c
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_object
              (
                core_field_type ([86,2130+13]..[86,2130+21])
                  Pfield "f"
                    poly
                    
                       c
                      (
                          a
                      )
                core_field_type ([86,2130+23]..[86,2130+31])
                  Pfield "g"
                    poly
                    
                       d
                      (
                          a
                      )
              )
    d
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_object
              (
                core_field_type ([87,2163+12]..[87,2163+20])
                  Pfield "f"
                    poly
                    
                       c
                      (
                          a
                      )
              )
  )
  type
  (
    c
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_object
              (
                core_field_type ([88,2187+13]..[88,2187+21])
                  Pfield "f"
                    poly
                    
                       c
                      (
                          a
                      )
              )
    d
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_object
              (
                core_field_type ([89,2210+12]..[89,2210+21])
                  Pfield "f"
                    poly
                    
                       c
                      (
                           int
                          (
                          )
                      )
              )
  )
  type
  (
    u
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_object
              (
                core_field_type ([90,2235+14]..[90,2235+20])
                  Pfield "x"
                    poly
                    
                      a
              )
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
          
               u
              (
                   t
                  (
                      a
                  )
              )
  )
  type
  (
    u
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              a
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
          
               u
              (
                   t
                  (
                      a
                  )
              )
  )
  type
  (
    u
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              a
  )
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
                   u
                  (
                       t
                      (
                      )
                  )
                   u
                  (
                       t
                      (
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
          )
        cstrs =
          (
          )
        kind =
          
              Ptyp_alias "a"
                Ptyp_object
                (
                  core_field_type ([97,2351+10]..[97,2351+16])
                    Pfield "x"
                      poly
                      
                        a
                )
  )
  type
  (
    u
      type
        params =
          (
            a
          )
        cstrs =
          (
          )
        kind =
          
              a
  )
  (
    case
    (
      x
         t
        (
        )
      (
        case
        (
          y
             u
            (
                a
            )
          =
          (
              x
              y
          )
        )
      )
    )
  )
  (
    case
    (
      x
         t
        (
        )
      (
        case
        (
          y
             u
            (
                a
            )
          =
          (
              y
              x
          )
        )
      )
    )
  )
  module M
    struct
    (
      class
      (
          params =
              (
                "a"
                "b"
              )
          class name = c
          class expr =
              fun
              label=""
                            x
                 int
                (
                )
                fun
                label=""
                                y
                  b
                  class_structure
                    (
                      Pcf_constr ([107,2579+6]..[107,2579+33])
                          a
                          arrow
                          
                             int
                            (
                            )
                             bool
                            (
                            )
                      Pcf_val "x" Immutable Fresh ([108,2613+6]..[108,2613+29])
                        (
                        []
                                                :
                             list
                            (
                                 float
                                (
                                )
                            )
                                                )
                      Pcf_val "y" Immutable Fresh ([109,2643+6]..[109,2643+15])
                        y
                      method f
                        (
                          case
                          (
                            x
                              a
                            ()
                                                      )
                        )
                                              method g
                        y
                                            )
      )
    )
  module M'
      M
      signature
      (
          sig_class
          (
            class_description ([116,2746+11]..[122,2927+8])
              pci_virt = Virtual
              pci_params =
                  (
                    "a"
                    "b"
                  )
              pci_name = "c"
              pci_expr =
                class_type ([116,2746+32]..[122,2927+8])
                  Pcty_fun ""
                     int
                    (
                    )
                  class_type ([116,2746+39]..[122,2927+8])
                    Pcty_fun ""
                      b
                    class_type ([116,2746+45]..[122,2927+8])
                      Pcty_signature
                      class_signature
                          Ptyp_any
                        (
                          Pctf_cstr ([117,2798+7]..[117,2798+34])
                            a
                            arrow
                            
                               int
                              (
                              )
                               bool
                              (
                              )
                          Pctf_val "x" Immutable Concrete ([118,2833+7]..[118,2833+25])
                               list
                              (
                                   float
                                  (
                                  )
                              )
                          Pctf_val "y" Immutable Concrete ([119,2859+7]..[119,2859+17])
                              b
                          Pctf_meth "f" Public ([120,2877+7]..[120,2877+28])
                              poly
                              
                                arrow
                                
                                  a
                                   unit
                                  (
                                  )
                          Pctf_meth "g" Public ([121,2906+7]..[121,2906+20])
                              poly
                              
                                b
                        )
          )
      )
  class
  (
      params =
          (
            "a"
            "b"
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      fun
            label=""
                        y
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr M.c
                        (
                            a
                            b
                        )
                      (
                          7
                          y
                      )
                                    )
  )
  class
  (
      params =
          (
            "a"
            "b"
          )
      class name = e
      class expr =
          fun
          label=""
                    ()
                      fun
            label=""
                        y
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr M'.c
                        (
                            a
                            b
                        )
                      (
                          1
                          y
                      )
                                    )
  )
  send g
  (
    new M.c
    (
        3
        "a"
    )
  )
  send g
  (
    new d
    (
        ()
                10
    )
  )
  send g
  (
    new e
    (
        ()
                7.1
    )
  )
  open M
  send g
  (
    new c
    (
        5
        true
            )
  )
  module M
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
                            ()
                              class_structure
                  (
                    method f
                      (
                        case
                        (
                          x
                            a
                          ()
                                                  )
                      )
                                        )
      )
    )
  module M'
      M
      signature
      (
          sig_class
          (
            class_description ([135,3275+17]..[135,3275+66])
              pci_virt = Concrete
              pci_params =
                  (
                    "a"
                  )
              pci_name = "c"
              pci_expr =
                class_type ([135,3275+26]..[135,3275+66])
                  Pcty_fun ""
                     unit
                    (
                    )
                  class_type ([135,3275+34]..[135,3275+66])
                    Pcty_signature
                    class_signature
                        Ptyp_any
                      (
                        Pctf_meth "f" Public ([135,3275+41]..[135,3275+62])
                            poly
                            
                              arrow
                              
                                a
                                 unit
                                (
                                )
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
                Ptyp_class M.c
          (
              a
          )
          (
          )
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
                Ptyp_class M'.c
          (
              a
          )
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
      class name = c
      class expr =
          fun
          label=""
                    x
            Ptyp_class c
            (
                b
            )
            (
            )
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
      class name = c
      class expr =
          fun
          label=""
                    x
            Ptyp_class c
            (
                b
            )
            (
            )
            class_structure
              (
              )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method f
                  1
                                )
      params =
          (
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method f
                  2
                                )
  )
  class
  (
      params =
          (
          )
      class name = e
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                      )
                    (
                        ()
                                            )
                                  Pcf_inher Fresh
                    Pcl_apply
                      constr d
                      (
                      )
                    (
                        ()
                                            )
                                )
  )
  send f
  (
    new e
    (
        ()
            )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_val "x" Immutable Fresh ([145,3646+20]..[145,3646+34])
                  ~-
                  (
                      true
                                        )
                Pcf_val "y" Immutable Fresh ([145,3646+35]..[145,3646+48])
                  ~-.
                  (
                      ()
                                        )
              )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method f
                  1
                                  method g
                  1
                                  method h
                  1
                                )
  )
  class
  (
      params =
          (
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method h
                  2
                                  method i
                  2
                                  method j
                  2
                                )
  )
  class
  (
      params =
          (
          )
      class name = e
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method f
                  3
                                  Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                      )
                    (
                        ()
                                            )
                                  method g
                  3
                                  method i
                  3
                                  Pcf_inher Fresh
                    Pcl_apply
                      constr d
                      (
                      )
                    (
                        ()
                                            )
                                  method j
                  3
                                )
  )
  let
  (
    e
      new e
      (
          ()
                )
  )
  (
    send f
    (
      e
    )
    send g
    (
      e
    )
    send h
    (
      e
    )
    send i
    (
      e
    )
    send j
    (
      e
    )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    a
            class_structure
              (
                Pcf_val "x" Immutable Fresh ([160,3994+19]..[160,3994+28])
                  1
                Pcf_val "y" Immutable Fresh ([160,3994+29]..[160,3994+38])
                  1
                Pcf_val "z" Immutable Fresh ([160,3994+39]..[160,3994+48])
                  1
                Pcf_val "a" Immutable Fresh ([160,3994+49]..[160,3994+58])
                  a
              )
  )
  class
  (
      params =
          (
          )
      class name = d
      class expr =
          fun
          label=""
                    b
            class_structure
              (
                Pcf_val "z" Immutable Fresh ([161,4059+19]..[161,4059+28])
                  2
                Pcf_val "t" Immutable Fresh ([161,4059+29]..[161,4059+38])
                  2
                Pcf_val "u" Immutable Fresh ([161,4059+39]..[161,4059+48])
                  2
                Pcf_val "b" Immutable Fresh ([161,4059+49]..[161,4059+58])
                  b
              )
  )
  class
  (
      params =
          (
          )
      class name = e
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_val "x" Immutable Fresh ([163,4144+2]..[163,4144+11])
                  3
                Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                      )
                    (
                        5
                    )
                                  Pcf_val "y" Immutable Fresh ([165,4170+2]..[165,4170+11])
                  3
                Pcf_val "t" Immutable Fresh ([166,4182+2]..[166,4182+11])
                  3
                Pcf_inher Fresh
                    Pcl_apply
                      constr d
                      (
                      )
                    (
                        7
                    )
                                  Pcf_val "u" Immutable Fresh ([168,4208+2]..[168,4208+11])
                  3
                method x
                  x
                                  method y
                  y
                                  method z
                  z
                                  method t
                  t
                                  method u
                  u
                                  method a
                  a
                                  method b
                  b
                                )
  )
  let
  (
    e
      new e
      (
          ()
                )
  )
  (
    send x
    (
      e
    )
    send y
    (
      e
    )
    send z
    (
      e
    )
    send t
    (
      e
    )
    send u
    (
      e
    )
    send a
    (
      e
    )
    send b
    (
      e
    )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    x
             int
            (
            )
            fun
            label=""
                        y
               int
              (
              )
              class_structure
                (
                  Pcf_val "x" Immutable Fresh ([181,4424+2]..[181,4424+11])
                    x
                  Pcf_val "y" Immutable Fresh ([182,4436+2]..[182,4436+11])
                    y
                  method x
                    x
                                      method y
                    y
                                    )
  )
  class
  (
      params =
          (
          )
      class name = d
      class expr =
          fun
          label=""
                    x
            fun
            label=""
                        y
              class_structure
                (
                  Pcf_inher Fresh
                      Pcl_apply
                        constr c
                        (
                        )
                      (
                          x
                          y
                      )
                                    )
  )
  let
  (
    (
      c
        new c
        (
            1
            2
        )
    )
  in
    (
      send x
      (
        c
      )
      send y
      (
        c
      )
    )
  )
  let
  (
    (
      d
        new d
        (
            1
            2
        )
    )
  in
    (
      send x
      (
        d
      )
      send y
      (
        d
      )
    )
  )
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
              )
  )
  new c
  module M
      struct
      (
        class
        (
            params =
                (
                )
            class name = c
            class expr =
                fun
                label=""
                                ()
                                  class_structure
                    (
                      Pcf_val "x" Immutable Fresh ([227,5401+6]..[227,5401+15])
                        1
                      method xc
                        x
                                            )
        )
      )
      signature
      (
          sig_class
          (
            class_description ([221,5301+10]..[223,5352+7])
              pci_virt = Concrete
              pci_params =
                  (
                  )
              pci_name = "c"
              pci_expr =
                class_type ([221,5301+14]..[223,5352+7])
                  Pcty_fun ""
                     unit
                    (
                    )
                  class_type ([221,5301+22]..[223,5352+7])
                    Pcty_signature
                    class_signature
                        Ptyp_any
                      (
                        Pctf_meth "xc" Public ([222,5330+6]..[222,5330+21])
                            poly
                            
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
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_val "x" Immutable Fresh ([232,5473+2]..[232,5473+11])
                  2
                method xd
                  x
                                  Pcf_inher Fresh
                    Pcl_apply
                      constr M.c
                      (
                      )
                    (
                        ()
                                            )
                                )
  )
  let
  (
    (
      d
        new d
        (
            ()
                    )
    )
  in
    (
      send xc
      (
        d
      )
      send xd
      (
        d
      )
    )
  )
  class
  (
      params =
          (
            "a"
          )
      class name = matrix
      class expr =
          fun
          label=""
                    (
            sz
            init
          )
            tuple
            (
                 int
                (
                )
                a
            )
            class_structure
              (
                Pcf_val "m" Immutable Fresh ([239,5615+2]..[239,5615+40])
                  Array.create_matrix
                  (
                      sz
                      sz
                      init
                  )
                method add
                  (
                    case
                    (
                      mtx
                         matrix
                        (
                            a
                        )
                      (
                      Array.get
                      (
                          Array.get
                          (
                              send m
                              (
                                mtx
                              )
                              0
                          )
                          0
                      )
                      :
                          a
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
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method m
                  new c
                  (
                      ()
                                        )
                                )
  )
  send m
  (
    new c
    (
        ()
            )
  )
  module M
    struct
    (
      class
      (
          params =
              (
              )
          class name = c
          class expr =
              fun
              label=""
                            ()
                              class_structure
                  (
                    method m
                      new c
                      (
                          ()
                                                )
                                        )
      )
    )
  send m
  (
    new M.c
    (
        ()
            )
  )
  type
  (
    uu
      type
        params =
          (
          )
        cstrs =
          (
          )
        kind =
            (
              A
                (
                     int
                    (
                    )
                )
                              B
                (
                    Ptyp_alias "a"
                      Ptyp_object
                      (
                        core_field_type ([248,5864+28]..[248,5864+35])
                          Pfield "leq"
                            poly
                            
                              a
                      )
                )
                            )
            )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_virt "m" Public ([250,5911+37]..[250,5911+58])
                    poly
                    
                      a
              )
  )
  module S
      struct
      (
        let
        (
          f
            (
              case
              (
                x
                  Ptyp_class c
                  (
                  )
                  (
                  )
                x
              )
            )
        )
      )
      signature
      (
          sig_value f
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
  module S
      struct
      (
        let
        (
          f
            (
              case
              (
                x
                  Ptyp_class c
                  (
                  )
                  (
                  )
                x
              )
            )
        )
      )
      signature
      (
          sig_value f
          value_description
              arrow
              
                Ptyp_class c
                (
                )
                (
                )
                Ptyp_class c
                (
                )
                (
                )
            (
            )
      )
  module M
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
              
                   int
                  (
                  )
      )
      class
      (
          params =
              (
              )
          class name = t
          class expr =
              fun
              label=""
                            ()
                              class_structure
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
                Ptyp_alias "a"
            Ptyp_object
            (
              core_field_type ([264,6199+17]..[264,6199+29])
                Pfield "m"
                  poly
                  
                    arrow
                    
                      a
                      a
            )
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
          arrow
          
             int
            (
            )
             bool
            (
            )
          arrow
          
            a
            a
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
          arrow
          
             int
            (
            )
             bool
            (
            )
          arrow
          
             int
            (
            )
             int
            (
            )
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
          Ptyp_object
          (
          )
          Ptyp_object
          (
            core_field_type ([268,6325+23]..[268,6325+25])
              Pfield_var
          )
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
          Ptyp_object
          (
            core_field_type ([269,6356+16]..[269,6356+18])
              Pfield_var
          )
          Ptyp_object
          (
          )
      )
    )
  )
  let
  (
    x
      ref
      (
          []
                )
  )
  module F
    functor X
    (
      signature
      (
      )
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
                
                     int
                    (
                    )
        )
        (
        x
        :
             ref
            (
                 list
                (
                    Ptyp_object
                    (
                      core_field_type ([273,6429+37]..[273,6429+42])
                        Pfield "m"
                          poly
                          
                             t
                            (
                            )
                    )
                )
            )
                )
      )
    )
  x
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
  (
    case
    (
      x
        Ptyp_alias "a"
           t
          (
              a
          )
      ()
          )
  )
  (
    case
    (
      x
         t
        (
            a
        )
      sequence
      (
        (
        x
        :
            a
                )
      ;
        ()
              )
    )
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
          
              Ptyp_object
              (
                core_field_type ([279,6568+14]..[279,6568+20])
                  Pfield "x"
                    poly
                    
                      a
              )
  )
  (
    case
    (
      x
        Ptyp_alias "a"
           t
          (
              a
          )
      ()
          )
  )
  (
    case
    (
      x
         t
        (
            a
        )
      sequence
      (
        (
        x
        :
            a
                )
      ;
        ()
              )
    )
  )
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
                    ()
                      class_structure
              (
                Pcf_constr ([284,6681+2]..[284,6681+32])
                    a
                    arrow
                    
                      Ptyp_object
                      (
                        core_field_type ([284,6681+20]..[284,6681+22])
                          Pfield_var
                      )
                       unit
                      (
                      )
                method m
                  (
                  (
                    case
                    (
                      x
                      ()
                                          )
                  )
                  :
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
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_constr ([288,6777+2]..[288,6777+32])
                    a
                    arrow
                    
                       unit
                      (
                      )
                      Ptyp_object
                      (
                        core_field_type ([288,6777+28]..[288,6777+30])
                          Pfield_var
                      )
                method m
                  (
                    case
                    (
                      f
                        a
                      f
                      (
                          ()
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
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                method m
                  1
                                  method n
                  send m
                  (
                    self
                  )
                                )
  )
  class
  (
      params =
          (
          )
      class name = d
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr c
                      (
                      )
                    (
                        ()
                                            )
                                  method o
                  send m
                  (
                    self
                  )
                                )
  )
  let
  (
    (
      x
        new d
        (
            ()
                    )
    )
  in
    (
      send n
      (
        x
      )
      send o
      (
        x
      )
    )
  )
  class
  (
      params =
          (
          )
      class name = c
      class expr =
          fun
          label=""
                    ()
                      class_structure
              (
                Pcf_virt "m" Public ([304,7022+20]..[304,7022+42])
                    poly
                    
                       int
                      (
                      )
                method m
                  1
                                )
  )
  Oo.id
  (
      Pexp_object      class_structure
        (
        )
  )
  Oo.id
  (
      Pexp_object      class_structure
        (
        )
  )
  Oo.id
  (
      Pexp_object      class_structure
        (
        )
  )
  let
  (
    (
      o
        Pexp_object        class_structure
          (
          )
    )
  in
    let
    (
      (
        s
          Marshal.to_string
          (
              o
              []
                        )
      )
    in
      let
      (
        (
          o'
            (
            Marshal.from_string
            (
                s
                0
            )
            :
                Ptyp_object
                (
                )
                        )
        )
      in
        let
        (
          (
            o''
              (
              Marshal.from_string
              (
                  s
                  0
              )
              :
                  Ptyp_object
                  (
                  )
                            )
          )
        in
          (
            Oo.id
            (
                o
            )
            Oo.id
            (
                o'
            )
            Oo.id
            (
                o''
            )
          )
        )
      )
    )
  )
  let
  (
    (
      o
        Pexp_object        class_structure
          (
            Pcf_val "x" Immutable Fresh ([317,7371+15]..[317,7371+25])
              33
            method m
              x
                        )
    )
  in
    let
    (
      (
        s
          Marshal.to_string
          (
              o
              ::
                (
                  Marshal.Closures
                                    []
                                  )
          )
      )
    in
      let
      (
        (
          o'
            (
            Marshal.from_string
            (
                s
                0
            )
            :
                Ptyp_object
                (
                  core_field_type ([319,7469+12]..[319,7469+17])
                    Pfield "m"
                      poly
                      
                         int
                        (
                        )
                )
                        )
        )
      in
        let
        (
          (
            o''
              (
              Marshal.from_string
              (
                  s
                  0
              )
              :
                  Ptyp_object
                  (
                    core_field_type ([320,7517+13]..[320,7517+18])
                      Pfield "m"
                        poly
                        
                           int
                          (
                          )
                  )
                            )
          )
        in
          (
            Oo.id
            (
                o
            )
            Oo.id
            (
                o'
            )
            Oo.id
            (
                o''
            )
            send m
            (
              o
            )
            send m
            (
              o'
            )
          )
        )
      )
    )
  )
  let
  (
    (
      o
        Pexp_object        class_structure
          (
            Pcf_val "x" Immutable Fresh ([323,7613+15]..[323,7613+25])
              33
            Pcf_val "y" Immutable Fresh ([323,7613+26]..[323,7613+36])
              44
            method m
              x
                        )
    )
  in
    let
    (
      (
        s
          Marshal.to_string
          (
              o
              ::
                (
                  Marshal.Closures
                                    []
                                  )
          )
      )
    in
      let
      (
        (
          o'
            (
            Marshal.from_string
            (
                s
                0
            )
            :
                Ptyp_object
                (
                  core_field_type ([325,7722+12]..[325,7722+17])
                    Pfield "m"
                      poly
                      
                         int
                        (
                        )
                )
                        )
        )
      in
        let
        (
          (
            o''
              (
              Marshal.from_string
              (
                  s
                  0
              )
              :
                  Ptyp_object
                  (
                    core_field_type ([326,7770+13]..[326,7770+18])
                      Pfield "m"
                        poly
                        
                           int
                          (
                          )
                  )
                            )
          )
        in
          (
            Oo.id
            (
                o
            )
            Oo.id
            (
                o'
            )
            Oo.id
            (
                o''
            )
            send m
            (
              o
            )
            send m
            (
              o'
            )
          )
        )
      )
    )
  )
)

