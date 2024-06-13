return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "haydenmeade/neotest-jest",
    "marilari88/neotest-vitest",
  },
  opts = {
    discovery = {
      enabled = false,
    },
    adapters = {
      ["neotest-jest"] = {
        jest_test_discovery = true,
      },
      ["neotest-vitest"] = {},
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
        local function fileExists(filename)
          local file = io.open(filename, "r")
          if file then
            io.close(file)
            return true
          else
            return false
          end
        end

        local testCommand

        if fileExists("vitest.config.ts") then
          local vitestCommand = "vitest --watch"
          testCommand = { vitestCommand = vitestCommand }
        else
          local jestCommand = require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h"))
          testCommand = { jestCommand = jestCommand .. " --watch" }
        end

        require("neotest").run.run({
          vim.fn.expand("%"),
          testCommand,
          suite = true,
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
