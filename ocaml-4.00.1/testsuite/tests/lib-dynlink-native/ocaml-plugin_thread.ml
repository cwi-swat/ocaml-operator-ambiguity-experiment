(
  let
  (
    ()
          sequence
      (
        Api.reg_mod
        (
            "Plugin_thread"
        )
      ;
        let
        (
          (
            _t
              Thread.create
              (
                  (
                    case
                    (
                      ()
                                            for i
                      1
                      5
                      sequence
                      (
                        print_endline
                        (
                            "Thread"
                        )
                      ;
                        sequence
                        (
                          flush
                          (
                              stdout
                          )
                        ;
                          Thread.delay
                          (
                              1.
                          )
                        )
                      )
                    )
                  )
                  ()
                                )
          )
        in
          for i
          1
          10
          sequence
          (
            print_endline
            (
                "Thread"
            )
          ;
            sequence
            (
              flush
              (
                  stdout
              )
            ;
              Thread.delay
              (
                  0.50
              )
            )
          )
        )
      )
  )
)
