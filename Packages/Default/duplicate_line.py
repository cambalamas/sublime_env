# https://gist.github.com/homm/1261735#file-duplicate_line-py

import sublime, sublime_plugin

class DuplicateLineCommand(sublime_plugin.TextCommand):
	def run(self, edit, force_lines=False):
		for region in self.view.sel():
			if force_lines or region.empty():
				line = self.view.line(region)
				line_contents = self.view.substr(line) + '\n'
				self.view.insert(edit, line.begin(), line_contents)
			else:
				self.view.insert(edit, region.begin(), self.view.substr(region))
