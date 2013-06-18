(
  external raise
  (
  value_description
      arrow
      
         exn
        (
        )
        a
    (
      "%raise"
    )
  )
  external not
  (
  value_description
      arrow
      
         bool
        (
        )
         bool
        (
        )
    (
      "%boolnot"
    )
  )
  external =
  (
  value_description
      arrow
      
        a
        arrow
        
          a
           bool
          (
          )
    (
      "%equal"
    )
  )
  external <>
  (
  value_description
      arrow
      
        a
        arrow
        
          a
           bool
          (
          )
    (
      "%notequal"
    )
  )
  external <
  (
  value_description
      arrow
      
        a
        arrow
        
          a
           bool
          (
          )
    (
      "%lessthan"
    )
  )
  external >
  (
  value_description
      arrow
      
        a
        arrow
        
          a
           bool
          (
          )
    (
      "%greaterthan"
    )
  )
  external <=
  (
  value_description
      arrow
      
        a
        arrow
        
          a
           bool
          (
          )
    (
      "%lessequal"
    )
  )
  external >=
  (
  value_description
      arrow
      
        a
        arrow
        
          a
           bool
          (
          )
    (
      "%greaterequal"
    )
  )
  external ~-
  (
  value_description
      arrow
      
         int
        (
        )
         int
        (
        )
    (
      "%negint"
    )
  )
  external +
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%addint"
    )
  )
  external -
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%subint"
    )
  )
  external *
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%mulint"
    )
  )
  external /
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%divint"
    )
  )
  external mod
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%modint"
    )
  )
  external land
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%andint"
    )
  )
  external lor
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%orint"
    )
  )
  external lxor
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%xorint"
    )
  )
  external lsl
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%lslint"
    )
  )
  external lsr
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%lsrint"
    )
  )
  external asr
  (
  value_description
      arrow
      
         int
        (
        )
        arrow
        
           int
          (
          )
           int
          (
          )
    (
      "%asrint"
    )
  )
  external ignore
  (
  value_description
      arrow
      
        a
         unit
        (
        )
    (
      "%ignore"
    )
  )
  type
  (
    ref
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
              contents
                  poly
                  
                    a
            )
            )
  external ref
  (
  value_description
      arrow
      
        a
         ref
        (
            a
        )
    (
      "%makemutable"
    )
  )
  external !
  (
  value_description
      arrow
      
         ref
        (
            a
        )
        a
    (
      "%field0"
    )
  )
  external :=
  (
  value_description
      arrow
      
         ref
        (
            a
        )
        arrow
        
          a
           unit
          (
          )
    (
      "%setfield0"
    )
  )
  external incr
  (
  value_description
      arrow
      
         ref
        (
             int
            (
            )
        )
         unit
        (
        )
    (
      "%incr"
    )
  )
  external decr
  (
  value_description
      arrow
      
         ref
        (
             int
            (
            )
        )
         unit
        (
        )
    (
      "%decr"
    )
  )
  type
  (
    option
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
              None
                (
                )
                              Some
                (
                    a
                )
                            )
            )
  type
  (
    weak_t
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
  external weak_create
  (
  value_description
      arrow
      
         int
        (
        )
         weak_t
        (
            a
        )
    (
      "caml_weak_create"
    )
  )
  external weak_set
  (
  value_description
      arrow
      
         weak_t
        (
            a
        )
        arrow
        
           int
          (
          )
          arrow
          
             option
            (
                a
            )
             unit
            (
            )
    (
      "caml_weak_set"
    )
  )
  external weak_get
  (
  value_description
      arrow
      
         weak_t
        (
            a
        )
        arrow
        
           int
          (
          )
           option
          (
              a
          )
    (
      "caml_weak_get"
    )
  )
  let
  (
    x
      42
  )
)

