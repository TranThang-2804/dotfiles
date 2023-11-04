return {
  { "echasnovski/mini.nvim", version = false },
  -- Options which control module behavior
  options = {
    -- Function to compute custom 'commentstring' (optional)
    custom_commentstring = nil,

    -- Whether to ignore blank lines
    ignore_blank_line = false,

    -- Whether to recognize as comment only lines without indent
    start_of_line = false,

    -- Whether to ensure single space pad for comment parts
    pad_comment_parts = true,
  },
}
