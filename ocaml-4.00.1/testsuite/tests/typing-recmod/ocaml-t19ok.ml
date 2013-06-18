(
  module PR_4758
    struct
    (
      module type S
        signature
        (
        )
      module type Mod
        signature
        (
            module Other
              S
        )
      Pstr_recmodule
      (
        "A"
            S
            struct
            (
            )
        "C"
            signature
            (
                sig_include
                  Pmty_with
                    Mod
                  (
                    Other
                      Pwith_module A
                  )
            )
            struct
            (
              module Other
                A
            )
      )
    )
)

