return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", 'nvim-telescope/telescope.nvim', },
    config = function()
      require("easy-dotnet").setup()
    end
  },
  {
    "seblj/roslyn.nvim",
    ft = "cs",
    opts = {
    }
  },
  {
    "dotnet/coreclr",
  },
}
