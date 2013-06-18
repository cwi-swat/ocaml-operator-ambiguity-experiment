(
  open Tscanf2_io
  let
  (
    slave
      Array.get
      (
          Sys.argv
          1
      )
  )
  let
  (
    (
      ic
      oc
    )
      Unix.open_process
      (
          slave
      )
  )
  let
  (
    ib
      Scanf.Scanning.from_channel
      (
          ic
      )
  )
  let
  (
    ob
      Buffer.create
      (
          1024
      )
  )
  let
  (
    send_string_ping
      (
        case
        (
          ob
          send_string
          (
              ob
              oc
              " Ping"
          )
        )
      )
  )
  let
  (
    send_string_stop
      (
        case
        (
          ob
          send_string
          (
              ob
              oc
              "stop"
          )
        )
      )
  )
  let
  (
    interact
      (
        case
        (
          i
          sequence
          (
            Printf.eprintf
            (
                " Ping"
            )
          ;
            sequence
            (
              flush
              (
                  stderr
              )
            ;
              sequence
              (
                send_string_ping
                (
                    ob
                )
              ;
                let
                (
                  (
                    s
                      receive_string
                      (
                          ib
                      )
                  )
                in
                  ifthenelse
                  (
                    if
                    (
                      <>
                      (
                          s
                          "-pong"
                      )
                    )
                    then
                    (
                      failwith
                      (
                          ^
                          (
                              "Master: unbound string "
                              s
                          )
                      )
                    )
                    else
                    (
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
    (
      n
        8
    )
  in
    let
    (
      (
        loop
          (
            case
            (
              i
              ifthenelse
              (
                if
                (
                  >
                  (
                      i
                      0
                  )
                )
                then
                (
                  sequence
                  (
                    interact
                    (
                        i
                    )
                  ;
                    loop
                    (
                        -
                        (
                            i
                            1
                        )
                    )
                  )
                )
                else
                (
                                  )
              )
            )
          )
      )
    in
      loop
      (
          n
      )
    )
  )
  sequence
  (
    send_string_stop
    (
        ob
    )
  ;
    let
    (
      (
        ack
          receive_string
          (
              ib
          )
      )
    in
      ifthenelse
      (
        if
        (
          =
          (
              ack
              "OK, bye!"
          )
        )
        then
        (
          sequence
          (
            print_endline
            (
                "Test OK."
            )
          ;
            exit
            (
                0
            )
          )
        )
        else
        (
            sequence
            (
              print_endline
              (
                  "Test Failed!"
              )
            ;
              exit
              (
                  2
              )
            )
        )
      )
    )
  )
)
