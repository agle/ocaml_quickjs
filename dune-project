(lang dune 3.19)
(using ctypes 0.3)

(name quickjs_eval)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name <author@example.com>")

(maintainers "Maintainer Name <maintainer@example.com>")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name quickjs_eval)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends ocaml ctypes ppx_blob)
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
