(
  match
  Sys.word_size
  (
    case
    (
      32
      sequence
      (
        print_int
        (
            *
            (
                1
                1000000000
            )
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
            print_string
            (
                "10000000000"
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
                print_string
                (
                    "100000000000"
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
                    print_string
                    (
                        "1000000000000"
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
                        print_string
                        (
                            "10000000000000"
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
                            print_string
                            (
                                "100000000000000"
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
                                print_string
                                (
                                    "1000000000000000"
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
                                    print_string
                                    (
                                        "10000000000000000"
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
                                        print_string
                                        (
                                            "100000000000000000"
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
                                            print_string
                                            (
                                                "1000000000000000000"
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
    case
    (
      64
      sequence
      (
        print_int
        (
            *
            (
                1
                1000000000
            )
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
            print_int
            (
                *
                (
                    10
                    1000000000
                )
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
                print_int
                (
                    *
                    (
                        100
                        1000000000
                    )
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
                    print_int
                    (
                        *
                        (
                            1000
                            1000000000
                        )
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
                        print_int
                        (
                            *
                            (
                                10000
                                1000000000
                            )
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
                            print_int
                            (
                                *
                                (
                                    100000
                                    1000000000
                                )
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
                                print_int
                                (
                                    *
                                    (
                                        1000000
                                        1000000000
                                    )
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
                                    print_int
                                    (
                                        *
                                        (
                                            10000000
                                            1000000000
                                        )
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
                                        print_int
                                        (
                                            *
                                            (
                                                100000000
                                                1000000000
                                            )
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
                                            print_int
                                            (
                                                *
                                                (
                                                    1000000000
                                                    1000000000
                                                )
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
    case
    (
      _
      assert false
    )
  )
)
