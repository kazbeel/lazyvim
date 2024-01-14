return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "haydenmeade/neotest-jest",
  },
  opts = {
    discovery = {
      enabled = false,
    },
    adapters = {
      ["neotest-jest"] = {
        jest_test_discovery = true,
      },
    },
  },
  keys = {
    {
      "<leader>tl",
      function()
        require("neotest").run.run_last()
      end,
      desc = "Run Last Test",
    },
    {
      "<leader>tc",
      function()
        require("neotest").run.run()
      end,
      desc = "Run Test Case",
    },
    {
      "<leader>tf",
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      desc = "Run Test File",
    },
    {
      "<leader>tw",
      function()
        -- require("neotest").run.run({ jestCommand = "npx jest --watch " })

        local jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
        require("neotest").run.run({
          vim.fn.expand("%"),
          jestCommand = jestCommand .. " --watch",
        })
      end,
      desc = "Test Watch",
    },
    {
      "<leader>tt",
      function()
        require("neotest").summary.toggle()
      end,
      desc = "Test Summary (Toggle)",
    },
  },
}
