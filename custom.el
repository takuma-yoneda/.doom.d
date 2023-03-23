(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; Somehow (require 'lsp-lua nil t) fails in some condition (i.e., inside the separated nix shell)
 ;; The below is the default package list except for lsp-lua.
 '(lsp-client-packages
   '(ccls lsp-actionscript lsp-ada lsp-angular lsp-ansible lsp-astro lsp-bash lsp-beancount lsp-clangd lsp-clojure lsp-cmake lsp-crystal lsp-csharp lsp-css lsp-d lsp-dart lsp-dhall lsp-docker lsp-dockerfile lsp-elm lsp-elixir lsp-emmet lsp-erlang lsp-eslint lsp-fortran lsp-fsharp lsp-gdscript lsp-go lsp-gleam lsp-graphql lsp-hack lsp-grammarly lsp-groovy lsp-haskell lsp-haxe lsp-idris lsp-java lsp-javascript lsp-json lsp-kotlin lsp-latex lsp-ltex lsp-markdown lsp-marksman lsp-mint lsp-nginx lsp-nim lsp-nix lsp-magik lsp-metals lsp-mssql lsp-ocaml lsp-openscad lsp-pascal lsp-perl lsp-perlnavigator lsp-pls lsp-php lsp-pwsh lsp-pyls lsp-pylsp lsp-pyright lsp-python-ms lsp-purescript lsp-r lsp-racket lsp-remark lsp-rf lsp-rust lsp-solargraph lsp-sorbet lsp-sourcekit lsp-sonarlint lsp-tailwindcss lsp-tex lsp-terraform lsp-toml lsp-ttcn3 lsp-typeprof lsp-v lsp-vala lsp-verilog lsp-vetur lsp-volar lsp-vhdl lsp-vimscript lsp-xml lsp-yaml lsp-ruby-syntax-tree lsp-sqls lsp-svelte lsp-steep lsp-zig))
 '(safe-local-variable-values
   '((eval progn
      (setenv "PYTHONPATH" "/Users/yoneda/workspace/luzhe/Mazed_Diffuser"))
     (eval progn
      (setenv "PYTHONPATH" #'/Users/yoneda/workspace/luzhe/Mazed_Diffuser)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "#e1e143" :height 5.0))))
 '(doom-modeline-buffer-modified ((t (:foreground "orange")))))
