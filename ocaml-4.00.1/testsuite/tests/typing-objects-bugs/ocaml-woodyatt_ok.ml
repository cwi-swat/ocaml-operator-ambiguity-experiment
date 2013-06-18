(
  class
  (
      params =
          (
          )
      class name = alfa
      class expr =
          class_structure
            (
              method x
                Printf.printf
                    poly
                     'a
                      arrow
                      
                         format
                        (
                            a
                             out_channel
                            (
                            )
                             unit
                            (
                            )
                        )
                        a
            )
  )
  class
  (
      params =
          (
          )
      class name = bravo
      class expr =
          fun
          label=""
                    a
            class_structure
              (
                Pcf_val "y" Immutable Fresh ([7,140+2]..[7,140+21])
                  (
                  a
                  :
                                         alfa
                      (
                      )
                  )
                Pcf_init
                  send x
                  (
                    y
                  )
                  (
                      "bravo initialized"
                  )
              )
  )
  class
  (
      params =
          (
          )
      class name = charlie
      class expr =
          fun
          label=""
                    a
            class_structure
              (
                Pcf_inher Fresh
                    Pcl_apply
                      constr bravo
                      (
                      )
                    (
                        a
                    )
                                  Pcf_init
                  send x
                  (
                    y
                  )
                  (
                      "charlie initialized"
                  )
              )
  )
)

