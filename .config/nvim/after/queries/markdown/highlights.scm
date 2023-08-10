; extends
((inline) @_inline (#match? @_inline "^\(import\|export\)")) @nospell

((inline) @spell
  (#match? @spell "{")
  (#match? @spell "\/")
  (#match? @spell "\*")
  (#match? @spell "\*")
  (#match? @spell "\/")
  (#match? @spell "}")
) @comment
