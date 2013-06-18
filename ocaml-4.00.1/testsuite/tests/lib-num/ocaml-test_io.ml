(
  open Test
  open Nat
  open Big_int
  open Num
  let
  (
    intern_extern
      (
        case
        (
          obj
          let
          (
            (
              f
                Filename.temp_file
                (
                    "testnum"
                    ".data"
                )
            )
          in
            let
            (
              (
                oc
                  open_out_bin
                  (
                      f
                  )
              )
            in
              sequence
              (
                output_value
                (
                    oc
                    obj
                )
              ;
                sequence
                (
                  close_out
                  (
                      oc
                  )
                ;
                  let
                  (
                    (
                      ic
                        open_in_bin
                        (
                            f
                        )
                    )
                  in
                    let
                    (
                      (
                        res
                          input_value
                          (
                              ic
                          )
                      )
                    in
                      sequence
                      (
                        close_in
                        (
                            ic
                        )
                      ;
                        sequence
                        (
                          Sys.remove
                          (
                              f
                          )
                        ;
                          res
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
  testing_function
  (
      "output_value/input_value on nats"
  )
  let
  (
    equal_nat
      (
        case
        (
          n1
          (
            case
            (
              n2
              eq_nat
              (
                  n1
                  0
                  length_nat
                  (
                      n1
                  )
                  n2
                  0
                  length_nat
                  (
                      n2
                  )
              )
            )
          )
        )
      )
  )
  List.iter
  (
      (
        case
        (
          (
            i
            s
          )
          let
          (
            (
              n
                nat_of_string
                (
                    s
                )
            )
          in
            ignore
            (
                test
                (
                    i
                    equal_nat
                    (
                      n
                      intern_extern
                      (
                          n
                      )
                    )
                )
            )
          )
        )
      )
      ::
        (
          (
            1
            "0"
          )
          ::
            (
              (
                2
                "1234"
              )
              ::
                (
                  (
                    3
                    "8589934592"
                  )
                  ::
                    (
                      (
                        4
                        "340282366920938463463374607431768211455"
                      )
                      ::
                        (
                          (
                            5
                            String.make
                            (
                                100
                                33
                            )
                          )
                          ::
                            (
                              (
                                6
                                String.make
                                (
                                    1000
                                    39
                                )
                              )
                              ::
                                (
                                  (
                                    7
                                    String.make
                                    (
                                        20000
                                        38
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
  testing_function
  (
      "output_value/input_value on big ints"
  )
  List.iter
  (
      (
        case
        (
          (
            i
            s
          )
          let
          (
            (
              b
                big_int_of_string
                (
                    s
                )
            )
          in
            ignore
            (
                test
                (
                    i
                    eq_big_int
                    (
                      b
                      intern_extern
                      (
                          b
                      )
                    )
                )
            )
          )
        )
      )
      ::
        (
          (
            1
            "0"
          )
          ::
            (
              (
                2
                "1234"
              )
              ::
                (
                  (
                    3
                    "-1234"
                  )
                  ::
                    (
                      (
                        4
                        "1040259735709286400"
                      )
                      ::
                        (
                          (
                            5
                            ^
                            (
                                "-"
                                String.make
                                (
                                    20000
                                    37
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
  testing_function
  (
      "output_value/input_value on nums"
  )
  List.iter
  (
      (
        case
        (
          (
            i
            s
          )
          let
          (
            (
              n
                num_of_string
                (
                    s
                )
            )
          in
            ignore
            (
                test
                (
                    i
                    eq_num
                    (
                      n
                      intern_extern
                      (
                          n
                      )
                    )
                )
            )
          )
        )
      )
      ::
        (
          (
            1
            "0"
          )
          ::
            (
              (
                2
                "1234"
              )
              ::
                (
                  (
                    3
                    "-1234"
                  )
                  ::
                    (
                      (
                        4
                        "159873568791325097646845892426782"
                      )
                      ::
                        (
                          (
                            5
                            "1/4"
                          )
                          ::
                            (
                              (
                                6
                                "-15/2"
                              )
                              ::
                                (
                                  (
                                    7
                                    "159873568791325097646845892426782/24098772507410987265987"
                                  )
                                  ::
                                    (
                                      (
                                        8
                                        ^
                                        (
                                            String.make
                                            (
                                                10000
                                                33
                                            )
                                            ^
                                            (
                                                "/"
                                                String.make
                                                (
                                                    5000
                                                    37
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
            )
        )
  )
)
