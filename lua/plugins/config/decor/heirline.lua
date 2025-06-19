---@diagnostic disable: unused-local

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

local function get_color(group, attr)
	local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
	return (ok and hl[attr]) and string.format("#%06x", hl[attr]) or nil
end

local colors = {
	fg = get_color("Normal", "fg"),
	bg = get_color("Normal", "bg"),
	comment = get_color("Comment", "fg"),
	constant = get_color("Constant", "fg"),
	keyword = get_color("Keyword", "fg"),
	special = get_color("Special", "fg"),
	statement = get_color("Statement", "fg"),
	string = get_color("String", "fg"),
	type = get_color("Type", "fg"),
	error = get_color("Error", "fg"),
	warning = get_color("DiagnosticWarn", "fg"),
	info = get_color("DiagnosticInfo", "fg"),
	hint = get_color("DiagnosticsHint", "fg"),
}

local Mode = {
	init = function(self)
		self.default_mode = { icon = "", fg = "#FFFFFF", bg = "#000000" }
		self.vimode = {
			["n"]   = { icon = "",  fg = "#FFFFFF", bg = colors.bg },
			["i"]   = { icon = "󰏫",  fg = "#000000", bg = colors.type },
			["v"]   = { icon = "󰈈|", fg = "#000000", bg = colors.statement },
			["V"]   = { icon = "󰈈-", fg = "#000000", bg = colors.statement },
			["\22"] = { icon = "󰈈", fg = "#000000", bg = colors.statement },
			["c"]   = { icon = "",  fg = "#000000", bg = colors.constant },
			-- ["R"]   = { icon = "",  fg = "#00FFFF", bg = colors.error },
		}
		setmetatable(self.vimode, {
			__index = function(_, key)
				return self.default_mode
			end,
		})
	end,
	provider = function(self)
		return " " .. self.vimode[vim.fn.mode()].icon .. " "
	end,
	hl = function(self)
		return { fg = self.vimode[vim.fn.mode()].fg, bg = self.vimode[vim.fn.mode()].bg, bold = true }
	end,
}

------------------------------
-->--> File Information <--<--
------------------------------

local FileIcon = {
	init = function(self)
		local ft = vim.bo.filetype
		local fname = vim.api.nvim_buf_get_name(0)
		local ext = vim.fn.fnamemodify(fname, ":e")
		local icon, icon_color = require("nvim-web-devicons").get_icon_color(fname, ext, { default = true })
		self.file_icon = icon or ""
		self.file_icon_color = icon_color or colors.fg
	end,
	provider = function(self)
		return self.file_icon
	end,
	hl = function(self)
		return { fg = self.file_icon_color }
	end,
}

local FileType = {
	provider = function()
		return vim.bo.filetype:upper()
	end,
}

local FileName = {
	provider = function()
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
		return filename
	end,
	hl = { fg = colors.cyan, bold = true },
}

local FileLocation = {
	provider = function()
		local fileloc = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":~:.:h")
		return "󰝰 " .. fileloc .. "/"
	end,
}

--- Git ---
local GitRemote = {
	condition = conditions.is_git_repo,
	provider = function()
		local handle = io.popen("git remote get-url origin 2>/dev/null")
		if not handle then return "" end

		local result = handle:read("*a")
		handle:close()

		if not result or result == "" then return "" end

		result = result:gsub("\n", "")

		local icon_map = {
			["github.com"] = "",
			["gitlab.com"] = "",
			["bigbucket.org"] = "󰘬"
		}

		local host = result:match("@([^:]+):")  --  git@source
		          or result:match("https?://([^/]+)")  --  http[s]?://source
		if host and icon_map[host] then
			return icon_map[host]
		else
			return "" -- fallback icon
		end
	end,
}

local GitBranch = {
	condition = conditions.is_git_repo,
	provider = function()
		return (vim.b.gitsigns_head or "") .. " "
	end,
}

local GitStatus = {
	init = function(self)
		self.status = vim.b.gitsigns_status_dict
		self.has_git = self.status_dict ~= nil
	end,
	condition = function(self)
		return self.has_git
	end,
	provider = function(self)
		local builder = ""
		if self.status and self.status.added > 0 then
			builder = builder .. " + " .. self.status.added
		end
		if self.status.changed > 0 then
			builder = builder .. " ~ " .. self.status.changed
		end
		if self.status.removed > 0 then
			builder = builder .. " - " .. self.status.removed
		end
		return builder
	end,
}

-------------------------
-->--> Diagnostics <--<--
-------------------------
local Diagnostics = {
	condition = conditions.has_diagnostics,
	static = {
		error = vim.diagnostic.severity.ERROR,
		warn	= vim.diagnostic.severity.WARN,
		info	= vim.diagnostic.severity.INFO,
		hint	= vim.diagnostic.severity.HINT,
	},
	init = function(self)
		self.errors	  = #vim.diagnostic.get(0, { severity = self.error })
		self.warnings = #vim.diagnostic.get(0, { severity = self.warn })
		self.infos		= #vim.diagnostic.get(0, { severity = self.info })
		self.hints		= #vim.diagnostic.get(0, { severity = self.hint })
	end,
	provider = function(self)
		local icons = {
			error = "  ",
			warn	= "  ",
			info	= "  ",
			hint	= "  ",
		}
		local builder = ""
		if self.errors > 0 then builder = builder .. icons.error .. self.errors end
		if self.warnings > 0 then builder = builder .. icons.warn .. self.warnings end
		if self.infos > 0 then builder = builder .. icons.info .. self.infos end
		if self.hints > 0 then builder = builder .. icons.hint .. self.hints end
		return builder
	end,
	hl = { fg = colors.error },
}

--->---> LSP Client Info <---<---
local Lsp_Clients = {
	init = function(self)
		self.clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
	end,
	provider = function(self)
		local builder = ""
		for _, client in ipairs(self.clients) do
			builder = builder .. " [" .. client.name .. "]"
		end
		return builder
	end,
}

local Ruler = {
	provider = " [%l:%c]󰣟 ",
	hl = { fg = colors.comment },
}

local Align = { provider = "%=" }
local Space = { provider = " " }

local SigHelp = {
	provider = function(self)
		return require("lsp_signature").status_line().label
	end,
	hl = { fg = colors.magenta, bg = colors.bg3 },
}

local FileInfo = { Space, FileLocation, FileName, Space, FileIcon }
local DiagnosticsInfo = { Diagnostics, Space }
local GitInfo = { GitRemote, Space, GitBranch, Space, GitStatus }

require("heirline").setup({
	statusline = utils.insert({
		Mode,
		Space,
		FileName,
		DiagnosticsInfo,
		GitInfo,
		Align,
		Align,
		FileInfo,
		Lsp_Clients,
		Ruler,
	}),
})

