; extends
((inline) @_inline (#match? @_inline "^\(import\|export\)")) @tsx

(fenced_code_block
  (info_string) @lang
  (code_fence_content) @content
  (#match? @lang "tsx")
  (#set! language "tsx")
)
