Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)


Status:children_add(function()
	local h = cx.active.current.hovered
	if not h or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line {
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	}
end, 500, Status.RIGHT)

require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}

-- require("git"):setup()


-- copy file contents to clipboard
require("copy-file-contents"):setup({
	append_char = "",
	notification = true,
})

-- You can configure your bookmarks using simplified syntax
-- local bookmarks = {
--   { tag = "Desktop", path = "~/Desktop", key = "d" },
--   { tag = "Documents", path = "~/Documents", key = "D" },
--   { tag = "Downloads", path = "~/Downloads", key = "o" },
-- }

-- You can also configure bookmarks with key arrays

local bookmarks = {
  { tag = "Desktop", path = "~/Desktop", key = { "d", "D" } },
  { tag = "Documents", path = "~/Documents", key = { "d", "d" } },
  { tag = "Downloads", path = "~/Downloads", key = { "o" },
}}


-- Windows-specific bookmarks
if ya.target_family() == "windows" then
  local home_path = os.getenv("USERPROFILE")
  table.insert(bookmarks, {
    tag = "Scoop Local",
    path = os.getenv("SCOOP") or (home_path .. "\\scoop"),
    key = "p"
  })
  table.insert(bookmarks, {
    tag = "Scoop Global",
    path = os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop",
    key = "P"
  })
end

require("whoosh"):setup {
  -- Configuration bookmarks (cannot be deleted through plugin)
  bookmarks = bookmarks,

  -- Notification settings
  jump_notify = false,

  -- Key generation for auto-assigning bookmark keys
  keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

  -- File path for storing user bookmarks
  path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark") or
         (os.getenv("HOME") .. "/.config/yazi/bookmark"),

  -- Path truncation in navigation menu
  path_truncate_enabled = false,                        -- Enable/disable path truncation
  path_max_depth = 3,                                   -- Maximum path depth before truncation

  -- Path truncation in fuzzy search (fzf)
  fzf_path_truncate_enabled = false,                    -- Enable/disable path truncation in fzf
  fzf_path_max_depth = 5,                               -- Maximum path depth before truncation in fzf

  -- Long folder name truncation
  path_truncate_long_names_enabled = false,             -- Enable in navigation menu
  fzf_path_truncate_long_names_enabled = false,         -- Enable in fzf
  path_max_folder_name_length = 20,                     -- Max length in navigation menu
  fzf_path_max_folder_name_length = 20,                 -- Max length in fzf

  -- History directory settings
  history_size = 10,                                    -- Number of directories in history (default 10)
  history_fzf_path_truncate_enabled = false,            -- Enable/disable path truncation by depth for history
  history_fzf_path_max_depth = 5,                       -- Maximum path depth before truncation for history (default 5)
  history_fzf_path_truncate_long_names_enabled = false, -- Enable/disable long folder name truncation for history
  history_fzf_path_max_folder_name_length = 30,         -- Maximum length for folder names in history (default 30)
}