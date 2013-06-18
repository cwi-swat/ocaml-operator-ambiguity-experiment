(
  module PR_4450_1
    struct
    (
      module type MyT
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
                      (
                        Succ
                          (
                               t
                              (
                                  a
                              )
                          )
                                                )
                                )
        )
      module MyMap
        functor X
        (
          MyT
          X
        )
      Pstr_recmodule
      (
        "MyList"
            MyT
              MyMap
            (
              MyList
            )
      )
    )
  module PR_4450_2
    struct
    (
      module type MyT
        signature
        (
            type
            (
              wrap
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
                        My
                          (
                               t
                              (
                                  a
                              )
                          )
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
                    
                        Ptyp_object
                        (
                          core_field_type ([12,251+25]..[12,251+55])
                            Pfield "map"
                              poly
                               'b
                                arrow
                                
                                  arrow
                                  
                                    a
                                    b
                                   wrap
                                  (
                                      b
                                  )
                          core_field_type ([12,251+57]..[12,251+59])
                            Pfield_var
                        )
            )
            sig_value create
            value_description
                arrow
                
                   list
                  (
                      a
                  )
                   t
                  (
                      a
                  )
              (
              )
        )
      module MyMap
        functor X
        (
          MyT
          struct
          (
            include
            (
              X
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
                                        l
                      class_structure
                        (
                          method map
                            (
                              case
                              (
                                f
                                My
                                  create
                                  (
                                      List.map
                                      (
                                          f
                                          l
                                      )
                                  )
                              )
                            )
                                poly
                                 'b
                                  arrow
                                  
                                    arrow
                                    
                                      a
                                      b
                                     wrap
                                    (
                                        b
                                    )
                        )
            )
          )
        )
      Pstr_recmodule
      (
        "MyList"
            signature
            (
                type
                (
                  wrap
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
                            My
                              (
                                   t
                                  (
                                      a
                                  )
                              )
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
                        
                            Ptyp_object
                            (
                              core_field_type ([24,595+17]..[24,595+47])
                                Pfield "map"
                                  poly
                                   'b
                                    arrow
                                    
                                      arrow
                                      
                                        a
                                        b
                                       wrap
                                      (
                                          b
                                      )
                            )
                )
                sig_value create
                value_description
                    arrow
                    
                       list
                      (
                          a
                      )
                       t
                      (
                          a
                      )
                  (
                  )
            )
            struct
            (
              include
              (
                  MyMap
                (
                  MyList
                )
              )
              let
              (
                create
                  (
                    case
                    (
                      l
                      new c
                      (
                          l
                      )
                    )
                  )
              )
            )
      )
    )
)

