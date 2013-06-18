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
                    v
            class_structure
              (
                Pcf_init
                  print_endline
                  (
                      v
                  )
                Pcf_val "v" Immutable Fresh ([2,32+48]..[2,32+58])
                  42
              )
  )
  new c
  (
      "42"
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
                    v
             int
            (
            )
            class_structure
              (
                method v0
                  v
                                  Pcf_inher Fresh
                    Pcl_apply
                      fun
                      label=""
                                            v
                        class_structure
                          (
                            method v
                              v
                                  poly
                                  
                                     string
                                    (
                                    )
                          )
                    (
                        "42"
                    )
                                )
  )
  send v0
  (
    new c
    (
        42
    )
  )
)

