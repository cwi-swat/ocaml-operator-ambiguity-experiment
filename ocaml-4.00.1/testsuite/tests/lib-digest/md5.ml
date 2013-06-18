
let _ =
  (* Test *)
  if test ""
  && test "a"
  && test "abc"
  && test "message digest"
  && test "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
  then printf "Test vectors passed.\n";
  flush stdout;
  (* Benchmark *)
  if (Array.length Sys.argv) > 1 && (Sys.argv.(1) = "-benchmark") then begin
    let s = String.make 50000 'a' in
    let num_iter = 1000 in
    time "OCaml implementation" num_iter
      (fun () ->
        let ctx = init() in
        update ctx s 0 (String.length s);
        ignore (finish ctx));
    time "C implementation" num_iter
      (fun () -> ignore (Digest.string s))
  end
