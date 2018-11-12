let () =
  Lwt_main.run begin
    (* let path = Dynlink.adapt_filename "_build/default/plugin/real_plugin.cma" in *)
    let path = Dynlink.adapt_filename "_build/default/plugin/plugin.cma" in
    try
      Dynlink.loadfile path;
      print_endline "Plugin loaded OK";
      Lwt.return_unit
    with
    | Dynlink.Error ex ->
      Format.printf "Failed to load GTK GUI plugin: %s@."
        (Dynlink.error_message ex);
      exit 1
  end
