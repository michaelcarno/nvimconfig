return {
"kwakzalver/duckytype.nvim",
event = "VeryLazy",
config = function()
   require('duckytype').setup{
  -- expected = "python_keywords",
  expected = "english_common",
  number_of_words = 42,
  average_word_length = 5.69,
}
end,
keys = {
 -- { "", function() end, desc ="" },
}
}
