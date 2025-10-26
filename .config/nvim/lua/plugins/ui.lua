return {
  'rmagatti/goto-preview',
  -- commit = "d771b5a590785e4f6f4fb4aa33ecb62ef2350f3e",
  branch = "fix-overly-strict-definition-provider-check",
  config = function()
    require('goto-preview').setup({
      default_mappings = true,
    })
  end,
}
