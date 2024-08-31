local status, startup = pcall(require, "startup")
if not status then
	vim.notify("Not found the plugin: startup.nvim")
end

local logos = {}
logos.tsumugi = {
	" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⠄⠤⠤⣄⡀⠠⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠄⠐⠒⠀⠀⠀⢀⠄⠈⠀⠰⠠⠑⠠⡀⠀⠀⠢⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠠⠲⠊⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⢡⠀⠀⠀⠱⡡⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⣰⠁⠀⠀⢠⠁⠐⠀⠀⠀⠀⠀⢸⠀⠀⡆⠀⠀⠀⢡⠐⠒⠂⢠⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⠸⡰⢁⡣⡂⢡⠏⢤⠇⠸⠀⠀⠀⠀⢸⠀⠀⢡⠀⠀⠀⠀⡆⠂⡄⠸⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⢀⠠⠂⠉⢀⢌⢃⠁⠀⠈⡚⠀⠘⢁⡟⠀⠀⠀⠀⠊⡆⢠⢸⠀⠀⠀⠀⢰⠰⠀⡄⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⡐⡡⠀⢀⠔⠁⠸⠂⠀⠀⢀⣇⡞⢖⢮⡇⢳⢀⢀⣠⠇⢠⡜⠀⡇⠀⠀⠀⠸⢡⠠⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠓⢀⠔⠕⠀⠀⠘⡀⠀⠐⡍⡞⠌⢊⠅⠀⠀⠀⠉⠜⣉⢳⢥⡇⡇⠀⠀⢠⢈⠀⠕⢄⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠆⠌⠀⠀⠐⠆⠡⠀⠀⢃⠧⡈⠘⠄⠀⠀⠀⠈⢰⠁⠅⠋⢫⠁⠀⠀⡌⠸⠀⠈⠄⠈⢒⢄⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠸⠃⠀⠀⡆⠀⠀⠑⡀⢆⠹⠀⠀⠀⠀⠀⠀⠈⠠⡠⠀⢀⠌⠀⢀⠎⢤⠀⠀⠀⡈⠄⠀⠡⠑⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⢠⠘⡀⠀⡇⠀⠀⠀⠇⠀⠈⠁⠒⠠⠄⣀⡀⠀⠀⠁⣩⠔⡡⠅⠓⠀⠀⠀⠀⠀⢠⢸⠀⠀⡃⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⣀⡀⠌⠢⢱⡀⠀⢰⠘⠜⠀⠀⠀⡠⠢⠣⢣⢊⠅⢄⠠⠁⠀⢀⠃⠀⠇⠀⠀⡠⠹⡈⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠀⠠⢀⣀⣀⠠⠀⠸⠀⠈⢃⣀⡐⢣⢡⢸⠹⡌⠀⠠⢕⠀⠀⡘⢀⠌⢀⠤⠊⢀⠖⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠢⠁⠀⠀⠈⠄⠸⠐⠈⠈⠄⢠⠁⡀⢘⠀⠀⡧⠖⠈⠀⠘⡀⠊⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⣀⠀⠀⠀⠀⠄⠀⠀⠀⡠⠐⠀⠀⠀⠀⠀⠁⠀⠁⠘⠀⠀⠀⠀⢃⠑⠄⡀⠀⠐⠄⣀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⢠⢑⢈⡠⠰⠸⠀⠀⠀⠨⠃⠃⠀⠀⠀⠀⠀⠀⠀⠄⠀⠀⠀⠀⠑⠀⠁⠄⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠃⠀⢀⡝⡤⡆⠧⠀⠀⠀⠀⠁⠠⢆⡀⠂⠀⠀⠀⠌⠀⠀⠀⠀⢀⠀⡂⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠠⢳⠈⠉⠀⡘⠪⠀⠀⠀⠀⠀⠀⠀⠐⢂⢰⠔⡔⠀⠐⠀⠘⠁⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠁⠀⠀⠐⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢺⢀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
	" ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
}

logos.ko_no_dio_da = {
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠸⣽⣿⣇⡤⠘⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠓⢤⣻⣿⣦⡤⠄⠄⠁⠄⠂⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⣿⡿⠏⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠻⣿⣷⣍⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣀⣀⣼⣿⠇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢿⡎⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⢟⣿⣟⠄⠄⠄⢰⣶⣄⢤⢀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⣾⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠏⣿⣿⠄⠄⢀⠘⠿⣿⣏⣤⡆⣵⣊⢿⣷⣦⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡾⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢘⣟⠁⠄⠄⣩⡠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠄⠄⠄⠄⠄⠄⠄⠠⡵⠒⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠉⠉⢹⠄⠄⠄⣿⣿⢿⠿⠿⢿⣿⣿⣿⣿⣿⣿⠄⠄⠄⠄⠄⠄⠄⠄⢶⠛⢆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⢀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠹⣿⣷⡦⣴⣿⣿⣿⡿⢫⣿⡟⠄⠄⠄⠄⠄⠄⠄⠄⠘⢇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠻⣿⣿⣟⠋⣉⣁⣀⣼⣿⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠲⣂⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⢻⣿⣦⣿⣿⣾⣿⡿⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢝⢷⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⢰⡇⠄⠄⠄⠄⠄⠄⠄⠄⠄⣠⣴⣶⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠙⣿⣍⣩⣵⡿⠇⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣷⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠰⠂⠘⢸⠄⠄⠄⠄⠄⠄⠄⠄⢀⣤⣿⡿⠋⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠈⠛⠛⠉⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢿⡄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠐⠄⡀⠄⠄⠄⠄⠄⠄⠄⠄⢀⣼⣟⠟⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠐⣄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠘⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢠⣾⡿⠟⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⣳⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢷⡿⠋⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣀⣀⣠⣿⣷⣿⣠⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⣠⠄⠄⢀⡀⠄⠄⠄⠄⠄⠄⠈⠄⠄⠄⠄⠄⠄⠄⠄⣀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⢿⡿⣿⣦⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠁⠄⠄⢸⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣭⣀⠆⣤⣖⣺⣙⣹⣿⣤⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
}

logos.jotaro = {
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⢻⣿⣿⣿⠿⠛⠉⠄⠄⠄⠄⠄⣈⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠄⠻⢿⠄⠈⠁⠄⠄⠄⠄⠄⠄⡐⣶⣆⢿⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠁⣿⡿⢺⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⡠⠄⠄⠄⠄⠄⠄⠄⠄⢀⣀⠤⠐⠒⠋⠉⠉⠈⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠄⠄⠄⠄⠄⠄⡄⠚⠁⠄⠄⠄⠄⠄⠄⠄⢀⣀⢀⣀⣬⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⢿⣿⢿⣿⣿⣿⣛⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠠⢀⣀⠄⡁⢅⠐⢸⣿⠣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⢀⣿⣿⢇⣻⣿⣿⣿⣰⠄⠄⠄⠄⠄⠄⠠⠊⠄⠄⠨⢑⣈⣴⣿⡯⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠂⡸⣿⣿⣿⣿⠽⣿⣿⣿⠄⠄⠄⢠⡯⢳⣼⣿⣿⣷⣿⣿⣿⣿⣥⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠄⠁⠘⣿⣿⣿⣿⡽⣿⣷⡆⠄⠄⠈⠧⣈⣻⣿⣿⣿⣿⣿⣿⡿⣫⣭⢾⣿⣿⣿⣿⡿⣿⣿⣿⠿⢟⡽⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⡟⡀⠄⠄⠄⠙⠿⣯⣿⠏⠈⢻⣿⡄⠄⠄⠄⠈⠚⠿⠿⠟⠛⠛⠉⣿⣯⣶⡿⣿⣿⣿⣿⣿⢽⣻⣖⣥⣓⣚⣹⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⢿⡻⣿⡿⢋⠐⠄⢸⣿⣮⣿⣆⠄⠄⠄⠄⠄⢷⡶⠄⠄⠄⡀⠄⠄⣰⣶⠄⠄⠄⠻⠿⣿⣿⣿⣿⣿⣿⢱⣄⣾⣿⣿⡟⡿⠿⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣾⣴⣶⣦⠄⠄⢸⣿⣿⡏⡁⡇⠄⠃⠄⠄⠄⠄⠄⠄⠈⠙⠄⠄⢿⣿⠃⠄⠄⢀⠄⢰⣿⡟⣿⠵⠅⣽⠿⠿⠛⠛⡧⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣥⣄⣠⠻⡿⠄⠄⢥⠄⠆⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠁⠄⠄⠄⠸⠦⠘⠛⠁⠄⠄⢀⣤⣴⣶⠄⢠⣯⢯⡧⢟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⡭⠩⣽⣿⣿⣿⣿⣿⡇⠂⠸⠄⠄⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠛⠄⢸⣻⣿⡿⠄⢸⣿⡿⡏⠝⡛⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⡟⠄⠄⣻⣿⣯⣍⣉⡝⠃⣀⡀⠄⠰⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠔⡽⠿⢷⢀⣘⣯⣷⣾⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⡟⠄⠄⠄⠻⠟⣿⡿⠿⠿⠿⠿⠄⠂⠄⡀⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢮⡶⢏⣻⡿⣿⣿⣿⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⡿⠄⠄⠄⠄⢠⡆⣴⣤⣀⢀⠄⠠⠐⢀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣓⣚⣍⠄⠙⣮⢟⢿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣧⠄⠄⠄⠄⠸⣼⣿⣿⣿⣧⠄⠄⠠⠂⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⡀⠄⠿⠿⣿⣷⡀⠘⣿⣯⣿⣿⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
}

logos.da_ka_ko_do_wa_ru = {
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠔⠄⢀⢢⠡⠄⠄⠄⠄⠄⠄⠄⠄⡠⠂⢀⠪⡐⢅⠪⡐⢅⠪⠐⠁⢌⠢⡑⢌⠢⠢⡐⠄⠄⡈⢖⢄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢂⠢⡑⡀⡡⠄⠄⠄⠄⠄⠄⢀⡜⡎⠄⠢⡑⢌⢢⠱⠈⣂⣴⡪⡧⢐⢑⢌⢢⠑⠑⠨⡊⠢⡀⠄⠑⢆⠐⠈⢀⠈ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⡄⣐⣅⣣⡀⠕⠄⠂⠄⠄⠄⠄⡠⡢⣳⣹⠂⡐⡑⢌⠊⣀⣴⡾⣯⡿⣜⢠⠐⡑⠔⢁⠠⠁⢐⠜⢌⠢⡑⢄⠂⢂⠈⢀⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣜⢰⢧⠓⠁⠯⡳⠠⠁⠄⡀⣄⠢⠂⢮⣻⢾⢀⣁⣤⡲⡳⠟⠓⠛⠋⡋⠁⡘⢇⢌⠐⡁⠂⠄⡢⡑⠅⠕⠈⡂⡣⡑⠔⢄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢰⠵⢘⣢⠲⣧⣆⠁⡑⠈⠈⠖⡵⠑⠄⠂⠙⠙⡋⠓⢁⣁⣀⣌⣐⡩⡂⠅⢅⢅⡂⡹⣝⠂⠄⠁⠂⡈⢐⠌⡢⠨⡂⠎⠊⡐⡑ ",
	" ⡠⠠⡀⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⢸⠅⣸⣧⣂⡙⠺⠗⢀⠁⢓⣬⣐⣬⢕⠢⢂⠂⠠⠒⡊⣚⠊⠚⠸⠺⠙⡉⡀⡁⡂⠂⠁⢀⠈⠄⠁⠄⠡⠨⣐⡅⢁⠔⠨⡨⡊ ",
	" ⠜⢌⠢⡪⠨⡢⢠⢀⠄⠄⠄⠄⠄⠄⠄⠈⡇⠗⢑⠑⠄⠄⠁⠄⢀⡾⣾⠽⣼⢾⣟⡗⠓⠣⣭⣘⠻⣽⣥⡀⠢⠄⠠⡀⢁⣿⣳⠈⠄⠄⠄⡤⣞⣾⣟⡯⡿⡧⡨⡐⡢⠊ ",
	" ⠨⢈⠊⡨⡈⠔⡄⢆⢄⢀⠄⠄⠄⠄⠄⠄⠁⠩⢐⠨⢀⠈⠄⡐⡇⣪⢸⣟⡯⣟⣷⣻⡦⡀⠄⠙⠻⣦⣬⣭⠩⠥⢐⠢⠹⡪⡎⠕⠄⣠⢶⣟⡯⠃⠅⠄⡈⡟⢄⠒⠄⠄ ",
	" ⠈⠄⠘⠐⠈⠈⠈⢂⠑⠌⠢⢂⠄⠄⠄⠄⡀⢅⢈⢊⠠⠄⣴⣽⣗⣮⢘⢓⡿⣽⢽⣾⣫⡮⣗⣖⣦⣤⣵⢦⣠⢠⣵⡣⠕⢁⠠⠁⢼⢾⣻⢉⢐⢄⠸⡨⠄⡇⠄⠄⠄⠄ ",
	" ⠄⠄⡀⠂⠌⡂⠂⠄⡀⡁⡈⢀⠡⠠⠁⠅⠂⠃⠐⠐⢀⣾⣳⣟⡾⣣⣧⡋⢯⢯⣟⣾⢯⣷⣟⣯⡷⣟⣾⢿⡽⣼⡾⠝⢀⢀⣄⢮⢻⡯⢁⠎⡗⣜⣸⢶⡴⠃⠄⠄⠄⠄ ",
	" ⠄⢀⠠⠄⠁⠄⠁⠅⠂⠂⡐⠄⡐⠈⠄⠄⠄⡀⡡⠑⡅⠩⢨⡱⠝⠝⠵⢧⣺⢯⣟⣾⣟⣷⣟⣾⣻⡽⣯⡿⣹⣷⢋⢴⣽⣻⡮⣷⣟⣧⠨⣳⢿⣻⢾⣟⠏⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠂⠄⠂⠄⠂⠁⠄⠄⠂⠄⠄⠄⠄⡔⠅⠔⠡⢁⠄⠪⠋⣂⣴⣻⣽⢯⣷⢿⣞⣷⣻⣞⡷⣟⣯⣽⢏⢥⢷⣻⣷⣻⢿⠉⠚⠄⢀⡳⣝⣮⡿⠃⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠈⢀⠄⠁⠄⠁⠄⠄⠄⠄⠂⠄⠄⠄⠄⢃⢊⡆⡨⢐⢴⡠⢑⢟⣾⣳⡯⣿⢽⣯⢿⣺⣗⣯⣿⣫⡾⣱⣺⣻⡯⣿⣞⡿⠁⠄⠄⢀⣤⡶⡟⠃⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠁⠄⠄⡀⠁⠄⠄⠠⠄⠄⠄⠄⠄⠄⠄⠐⡮⣃⢦⣣⡥⢅⠉⢌⢳⣯⢿⣽⣻⢾⣻⣽⣾⡻⣲⢋⣞⡾⣽⣳⣟⡿⣞⢹⣶⡦⢶⣻⠯⡋⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠁⠄⠄⠄⠄⠈⠄⠄⠄⠄⠄⠄⠄⠄⠄⢀⠫⣳⣻⡶⣶⣯⣵⣨⠲⡙⡽⣾⢽⣯⢿⣺⢣⣾⣡⡷⣯⡿⣽⣗⡯⡟⠄⠑⠡⠫⠓⡥⢲⠁⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⢀⠄⠂⠄⠄⠄⠄⠠⠄⠁⠄⠄⠄⠄⠄⢐⠠⢀⣈⡋⠟⠾⡷⣟⣿⣖⡶⣞⣿⡽⣯⢏⣷⣟⡾⣯⡷⣿⣻⡾⡝⢀⠴⠑⢂⠢⡑⠴⠋⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄ ",
	" ⠄⠄⠄⠄⠄⠄⡀⠄⡀⠄⠄⠄⠄⠄⠄⠄⠄⠄⡂⡢⣷⣻⣟⣷⣭⣏⣧⡿⣽⣯⡷⡟⢫⣟⣾⣳⣟⣯⢿⣳⣻⠊⠠⠣⣐⢉⡀⠕⠈⠄⠐⠠⢑⠠⠄⠄⠄⠄⠄⠄⠄⠄ ",
}

logos.kanade = {
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣛⣯⣭⣿⣿⣿⣶⣶⣿⣯⣭⣟⣻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣯⣾⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣯⣟⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⣰⣾⣿⣿⣿⣻⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣝⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⢟⡅⣼⣿⣿⡿⣫⣿⣿⣿⣿⣿⣿⢟⣝⣵⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣽⣻⡿⠿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⡿⣣⡿⣼⣿⣿⢫⣾⣿⣿⣿⣿⣿⣿⢋⣵⣿⣿⣿⡟⣽⣿⣿⣿⣿⣘⣹⣿⣿⣿⣿⣷⡀⢭⣥⣤⣭⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⡿⣵⣿⢳⣿⡿⣳⣟⣿⣿⣿⣿⣿⣿⣣⣿⡿⣿⡿⣫⢶⣿⣿⣿⣿⣯⣿⡿⣿⣿⣿⣿⣟⣿⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⡿⣝⣿⡿⣾⣽⢝⣯⣹⣏⣿⣿⣿⡿⠃⠉⠉⠚⠫⣾⣿⣼⣿⣿⣿⡿⣼⣿⡇⣿⣏⣿⣿⣿⡾⣿⡀⢿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⢳⣿⡿⣡⣿⣿⣿⡏⣿⢹⣿⣿⣿⠃⠖⠵⠆⠄⠄⠈⠣⣿⣿⣽⣿⣽⣿⣿⣇⣿⢻⣿⣿⣿⣷⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣾⣟⣼⣿⣿⣿⢟⣧⡟⣿⡽⡝⣿⢿⣤⠄⢀⠄⢀⠄⣧⣹⣿⣿⣾⣿⣿⣿⢻⢏⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣟⢯⣾⣿⣿⣿⣻⣿⠏⣾⠘⠙⢃⢽⢼⢿⣷⣤⣶⣿⣿⣿⣿⣿⣿⣿⢋⠁⢠⡀⠹⣿⣿⣷⣿⣟⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣯⣎⣾⢿⣿⣿⣿⣿⢯⣷⢇⣀⠄⠘⣗⢼⣿⣭⣭⣵⣾⣿⣿⣿⣿⣿⠣⣡⣤⣿⣥⣾⣿⣟⣾⡿⣽⡟⠄⣾⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⡟⣾⣟⣿⣿⢳⣿⠫⣈⣹⣛⣻⡟⢸⣝⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡷⣻⣟⣻⣏⣽⠟⣾⡟⢁⠟⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⢹⣿⢹⣿⡟⣿⣿⡇⣿⣇⣿⣿⣇⠋⢿⣞⠻⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣱⡿⣿⠟⠰⠋⣠⣴⣠⣾⣯⣿⣝⢿⣿⣿⣿⣿⣿ ",
	" ⡿⣾⠇⣾⣿⡿⣿⣿⣷⢻⣷⡝⢿⣿⣿⣷⣿⡷⡲⣍⠛⠻⠿⠿⠿⠿⠿⢿⢛⣅⣽⣎⠄⣬⣾⣿⣿⣿⣿⣿⣿⢿⠂⣿⣿⣿⣿⣿ ",
	" ⡧⣿⠄⢸⣿⣷⣻⣿⣻⣯⢿⣿⣖⢏⡻⣿⣿⣿⣼⣎⣧⣀⡠⣻⡛⣿⣿⣿⣞⣿⡼⣿⣷⣽⡛⣿⣿⣿⣛⣯⠷⠋⣠⣿⣿⣿⣿⣿ ",
	" ⣇⡧⡸⡟⣿⣿⣷⣝⡿⣽⢿⣝⢿⣯⡚⢧⢟⣽⣿⣿⣯⢿⣶⡽⣟⣿⣿⣿⣿⣾⢿⣽⣿⣿⣿⣷⣿⣭⣭⣀⣰⣾⣿⡿⢿⣿⣿⣿ ",
	" ⣿⣳⠸⣿⣝⣿⣿⣿⣟⢷⣶⡍⠛⠚⢋⣁⣩⣷⢿⣻⣯⢩⠛⠙⠮⣮⠟⠻⠿⣿⣿⣯⣟⡿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠛⢁⣉⡻ ",
	" ⣿⣿⡂⢿⣿⣮⢿⣿⣿⣇⢙⡻⢮⣷⢦⣬⢠⢧⢁⣽⢮⣽⡶⣶⣶⣦⢀⡀⠄⢻⣿⣿⣿⣿⣷⣮⣍⢉⣉⣉⣠⣤⣴⣶⣾⣿⣿⣿ ",
	" ⣿⣿⣿⣾⣿⣿⣿⣝⡻⢿⣦⡻⣶⣤⣭⣑⠋⠁⢸⣿⣿⡿⣽⣽⣟⠿⢼⣇⡀⠈⠻⣿⣿⣿⣷⣯⡛⠳⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣬⣍⣈⣛⣿⣿⠁⣀⢴⣿⣿⣹⣿⣿⡿⣽⣮⣿⣾⡀⠒⠲⠭⠍⢉⣉⣉⣊⢲⣼⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠉⠓⠚⢦⣿⣿⠏⢾⣿⣿⡎⠋⣠⣿⣿⣿⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣤⣼⡿⠁⣠⣬⢿⣿⢧⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⢀⣼⣿⣿⣧⢶⣿⡄⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣞⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣌⠁⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
}

logos.stand_attack = {
	" ⠈⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⣤⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠋⠉⡇⢸⡀⢙⡏⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⠀⢀⣀⣠⣤⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣿⢛⠛⠉⠁⠀⠀⡝⡀⠀⡰⠀⢸⠕⢁⠇⠀⣿⣿⣿⣿⣿⢉⠋⠉⠉⢻⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣟⣛⡋⠉⠀⣀⠐⠃⠙⠛⠛⠛⡢⠾⠿⠦⡠⠧⠐⠋⠀⣈⠉⠇⣿⣿⣿⣿⡗⠐⠃⣀⡀⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⡿⠿⠟⣛⡭⣋⠲⡿⣟⣰⠈⠀⠀⢰⣿⣿⣿⠿⠄⣠⡶⠔⠂⠉⠀⠀⡠⡒⠀⠄⠆⡄⢸⣿⣿⣿⣿⣯⣠⣀⣀⣀⣹⣿⣿⣿⣿ ",
	" ⢛⠛⡉⠁⠀⠁⠀⡉⠟⠛⡀⠀⠈⡻⠇⠀⢀⣀⡱⣿⣿⠋⡸⣷⡿⣦⣤⡶⠋⡠⠊⣰⢀⠌⠐⠈⠃⢸⣿⣿⣿⣿⣿⣀⣀⣀⣀⣿⣿⣿⣿⣿ ",
	" ⠇⠂⠀⡐⢀⠂⠰⣖⠄⣡⣶⡮⣷⡄⡀⠀⠸⢇⢹⠓⠁⠤⠛⠛⠋⠉⡐⢁⣾⣲⣶⡾⣿⣄⠁⠀⠀⢸⣿⣿⣿⣿⣿⠂⠆⢐⣒⣾⣿⣿⣿⣿ ",
	" ⢀⡈⡘⠉⡗⢰⣟⠤⢈⠻⠿⠙⠒⠀⠼⣂⡘⣿⢿⠇⢢⣲⡖⣛⡘⢈⣉⣁⣙⠿⢿⣾⣿⣿⣷⡄⠀⠈⣿⣿⣿⣿⣿⠚⠒⠒⠒⢺⣿⣿⣿⣿ ",
	" ⢤⠀⠀⡘⢀⢁⢉⢠⡬⣀⠈⢉⣡⣾⣿⣿⣇⣘⣷⣾⣷⢽⡟⣥⣾⣿⣿⡳⠶⠏⢶⡌⠛⢚⣋⠀⠀⡀⣿⣿⣿⣿⣧⠀⠀⠀⠀⢸⣿⣿⣿⣿ ",
	" ⠇⠀⠠⠁⡒⢸⢸⡎⣧⠻⡇⣿⣿⣿⣻⣿⣿⡭⣻⣮⣿⡆⠉⠲⣌⡙⠋⠁⠂⢀⣾⣿⠮⢦⠋⠀⠈⢰⣿⣿⣿⣿⣿⠀⠉⠉⠀⣿⣿⣿⣿⣿ ",
	" ⠁⢠⠃⢠⡅⢸⠸⠇⡸⣀⠁⢻⢹⣿⣿⡻⣿⣿⢽⣿⠟⡁⡀⣤⣀⣛⠻⢖⣤⣤⣤⣤⣶⡾⠀⠀⠀⣸⣿⣿⣿⣿⣿⠉⠉⠉⠉⣿⣿⣿⣿⣿ ",
	" ⠀⡏⢰⢹⣿⡜⣠⠘⣧⠋⠀⢺⣾⣿⣿⣧⠹⣿⣿⢃⣽⣿⣿⣿⣿⣿⣷⣾⣏⢻⣛⠛⠻⠁⢢⣚⣴⣿⣿⣿⣿⣿⣿⠀⠒⠒⠀⣼⣿⣿⣿⣿ ",
	" ⠁⠃⣿⣄⣿⢻⡿⢰⡏⠟⣄⣀⣉⣉⣭⣴⣾⣿⣿⣿⣿⣿⣿⣟⣿⣿⣯⣿⣿⣿⣏⡀⡱⠺⢲⢸⣿⣿⣿⣿⣿⣿⣿⣤⣴⠌⣤⣿⣿⣿⣿⣿ ",
	" ⠸⢠⣿⢹⣤⡚⣛⢠⠆⠷⢭⣭⣍⠠⡵⣻⣿⣿⣟⣿⣿⢟⣿⣿⣿⣿⣿⣿⣿⣿⠏⢡⠃⢀⣏⢆⣿⣿⣿⣿⣿⣿⣧⠀⡜⠠⠄⣼⣿⣿⣿⣿ ",
	" ⡇⠀⢃⣦⣻⢿⡞⡞⠀⠀⠀⠈⠙⠣⠩⠧⢿⣿⣿⣿⣯⢿⣿⣿⣿⣿⣿⠿⠛⠛⠃⠁⠀⠈⡉⢸⣿⣿⣿⣿⣿⣿⡟⠀⠑⠀⠀⢿⣿⣿⣿⣿ ",
	" ⠀⠰⣿⣟⣿⣿⡇⢀⡄⡀⣀⣤⠖⡂⠄⢩⣺⣿⣿⣿⣷⣿⣿⡛⣉⠁⠀⠀⠀⡠⠢⠀⡰⠃⢀⣿⣿⣿⣿⣿⣿⣿⣟⠋⠑⢟⠓⣻⣿⣿⣿⣿ ",
	" ⠀⡷⣭⣽⢏⡞⢰⣿⢣⣾⣿⣽⠒⣥⣲⡸⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⢀⠴⢠⠃⡔⡁⣠⣾⣿⣿⣿⣿⣿⣿⣿⣯⠤⠄⢆⣀⣿⣿⣿⣿⣿ ",
	" ⠀⣳⣭⡏⣾⠁⣿⣧⣜⡿⣿⣿⣿⡿⠿⢰⣿⣿⣿⣿⣿⣿⣯⣿⠋⠀⠠⡒⣠⡷⣜⠿⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⣤⣀⣠⣤⣽⣿⣿⣿⣿ ",
	" ⠀⢿⣿⠀⣿⣧⡙⢿⣿⣿⣿⣦⡶⢖⣠⣿⣿⣿⣿⣿⣿⢻⡿⠁⢀⣴⣾⣰⡿⣾⣅⡅⢀⡤⠋⠛⡻⢿⣿⣿⣿⣿⣿⣿⢻⡟⣿⣿⣿⣿⣿⣿ ",
	" ⣦⣿⣟⠀⢻⣿⣿⣶⣮⣭⣯⣵⣾⣿⣿⣿⣿⣿⡿⣿⢯⣿⠀⣠⡜⣫⠞⠉⠊⠁⢟⢟⣿⢦⢢⠎⣠⣉⠻⣿⣿⣿⣿⣿⣸⣇⣿⣿⣿⣿⣿⣿ ",
	" ⣏⣿⣯⠀⠀⠉⠛⠻⠿⠿⠿⢿⠛⣹⣿⣿⣼⣿⣿⣿⠟⢉⠽⢁⠜⠁⠀⠀⣠⠟⡡⠊⠁⠁⢈⠿⠞⣁⠔⡊⠈⠈⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⢻⣿⣦⣄⣀⡀⢀⣀⣄⣲⣴⣿⣿⣻⣿⣿⣿⡟⠉⡀⠊⠔⠁⠀⠀⣠⡾⠁⠈⠂⠀⢀⠔⠁⣠⠚⠁⠀⠀⠀⠀⡀⢼⢎⢻⣿⣿⣿⣿⣿⣿ ",
	" ⣼⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⡠⠊⠀⠁⠀⠀⠀⠚⠃⠁⠀⠀⠀⠀⠁⠐⠀⠃⠉⠀⠀⠀⠀⠀⠀⠀⠀⡜⣿⣿⣿⣿⣿⣿ ",
	" ⡉⣧⢯⠻⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣠⣄⡄⡀⡀⡀⠀⢐⠁⢀⡟⠅⣿⣿⣿⣿⣿⣿ ",
}

logos.misuzu = {
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣛⣻⣭⣭⣭⣭⣭⣭⣭⣝⣛⠟⠿⣟⢛⡿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣭⣶⣶⣮⣭⣿⣿⣿⣿⣿⣯⣿⣶⣶⣷⣶⣯⡳⣮⣝⠧⣿⣾⣿⣭⣽⣟⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⡿⣛⣵⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣛⣛⢿⣿⣿⣿⣎⢿⣷⣮⡛⣛⠿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⡿⣻⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣧⢿⣿⣷⠘⢼⣾⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣟⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡞⡼⣿⡇⡜⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣟⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣷⢛⣵⣷⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⡿⣼⢟⣻⣿⣿⣿⣿⣿⣿⣿⡧⣿⣿⣿⣿⣿⣿⣿⡏⢻⣿⣿⣛⣿⢞⣿⣿⣿⣿⣿⢻⣿⣿⠘⣿⣿⣤⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⢷⢯⣾⣿⣿⣿⣿⣿⣯⢳⣿⢧⣿⡿⣿⣿⣿⣿⣿⣧⣾⣿⢹⢻⣿⢻⣨⣿⣿⣿⣿⢸⣿⣿⡘⡽⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⢬⣿⣿⣿⡇⣿⣿⣿⣿⢸⣿⢸⢹⣷⢻⣿⣿⣿⣿⣸⡇⡿⣾⡏⣿⢸⡏⣿⣿⣿⣿⣿⣿⣿⡇⣿⡽⣹⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⢸⣧⢿⣿⣿⡟⠠⠛⠘⠓⠺⣏⡏⢿⣿⢈⣿⣧⢃⠉⠁⠉⠛⢇⣿⡿⣿⣿⡿⣿⣿⣇⣿⣿⣽⣿⣮⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣇⢟⣞⢿⣿⣧⢰⣮⡄⠄⠄⠈⣖⣎⢿⣸⣿⣯⣾⠖⠄⠄⠄⡀⡿⡹⣿⣿⣧⣝⢿⣹⣿⣿⣿⣿⡿⣱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⡯⣻⣮⡻⣻⡚⣧⣀⣤⣤⣀⣿⣿⣿⣿⣿⣿⣿⣤⣤⣤⣀⣏⡅⡇⣿⣿⣿⡟⡀⣿⡿⠟⠿⢛⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣇⣿⣿⢸⣶⣽⣿⣯⣛⣛⣿⣿⣿⣿⣿⣿⣿⣿⣷⣭⣭⣾⣾⡇⣷⢻⣿⡟⣵⡇⣫⡎⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣹⣿⣿⡜⢿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⢇⣿⡞⣿⣷⢻⣿⣿⣹⣿⢱⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⡿⣱⣿⣿⣿⣇⣆⣭⣛⡿⠿⣿⣿⣿⣿⠈⣷⣿⣿⣿⣿⣿⣟⣻⣵⣾⣻⣿⡜⣿⣧⡻⣿⣿⡏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣟⣽⣿⣿⣿⡟⣨⣿⣿⣿⣿⣿⣶⣶⠖⢽⣀⣋⣙⢲⢲⢸⣮⢻⣿⣿⣿⣡⢻⣿⣾⣿⣿⣝⠿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⢫⣾⣿⣿⡿⣫⣾⣿⣿⣿⣿⣿⣿⣿⣇⡇⠛⣣⡍⢭⣅⠇⠻⢿⢯⣿⣿⢣⣿⣷⣝⠿⣿⣿⣿⣷⣽⣿⣿⣿⣿⣿⣿⣿⠿⢿⠟⠛⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣷⣿⣿⣿⢫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣴⣿⢟⣵⣮⡻⣷⣮⡀⢿⣿⡟⣾⣿⣿⣿⣿⣮⣝⠿⣿⣿⣿⣯⡻⣿⣿⣿⣶⣤⡀⠄⠄⠄⠄⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⢣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⡺⠟⠁⠉⠉⠉⠁⠈⠛⣋⡄⣹⢷⣿⣿⣿⣿⣿⣿⡏⡼⣾⣝⣿⣿⣿⣼⣿⣿⣿⣿⣧⠄⠄⠄⠄⠄⠄⠙⢿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣻⣿⣿⡞⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠄⣠⣄⡀⣠⣤⡄⠄⠄⠄⢿⢸⣿⣿⢷⣿⣿⣿⢳⢣⢿⣿⣼⣿⣿⣹⣿⣿⣿⣿⣿⣧⠄⠄⠄⠄⠄⠄⠄⠙⢿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣝⢿⣿⣿⣿⣿⣿⣿⡟⠉⠄⠄⣸⣿⣿⣼⣿⣿⣿⠄⠄⠄⠄⠘⣿⣿⢸⣿⣿⣿⢸⣯⢮⡻⣹⡿⣷⣿⣿⣿⣿⣿⣿⣿⣆⠄⠄⠄⠄⠄⠄⠄⠄⠉⠛⠛⢻ ",
	" ⣿⣿⣿⣷⣯⣽⣓⠯⣝⣻⣿⣿⣿⣷⡀⠄⠄⠄⠄⠄⠉⠉⠉⠄⠄⠄⣀⣤⢰⣿⣿⢸⣿⣿⣿⣏⢿⣷⣱⠏⣚⢿⣿⣿⣿⣿⣿⣿⠛⢛⣴⣤⢠⣤⣤⣶⣶⣶⣶⣦⣤⣾ ",
	" ⣿⣿⣿⣿⣿⣿⣿⡟⣾⡿⣍⣿⣿⣿⣿⣶⣾⡄⠄⠄⠄⠄⠄⠄⢰⣿⣿⣿⣧⢿⣿⡄⢿⣿⣿⣿⣦⣛⢽⣺⠔⣥⡪⠻⣿⣿⣿⣿⣿⣿⣧⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣣⠟⣽⣿⣿⣿⣿⣿⣿⣿⣷⡀⠄⠄⠄⠄⠄⢸⣿⣿⣿⣿⣷⣝⡻⡔⣝⠿⣿⣿⣿⣷⡝⣿⣮⣿⣧⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠄⠄⠄⠄⠄⣸⣿⣿⣿⣿⣿⣿⣿⠰⣿⣿⣶⣮⣭⡫⢳⣽⣿⣿⣏⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
	" ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⣶⣤⣴⣿⣿⣿⣿⣿⣿⣟⣋⣾⣿⣿⣿⣿⠿⠿⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ",
}

local logo_keys = {}
for key in pairs(logos) do
	table.insert(logo_keys, key)
end

math.randomseed(os.time())
local index = math.random(#logo_keys)
local curr_key = logo_keys[index]

startup.setup({
	header = {
		type = "text",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Header",
		margin = 0,
		content = logos[curr_key],
		highlight = "Statement",
		default_color = "",
		oldfiles_amount = 0,
	},
	body = {
		type = "mapping",
		oldfiles_directory = false,
		align = "center",
		fold_section = false,
		title = "Basic Commands",
		margin = 0,
		content = {
			{"  Find file", "Telescope find_files", "<C-p>"},
			{"  File manager", "NERDTreeToggle", "<F2>"},
			{"  Recent", "Telescope oldfiles", "<leader>fr"},
		},
		highlight = "String",
		default_color = "",
		oldfiles_amount = 0,
	},
	clock = {
		type = "text",
		content = function ()
			local time = "󰥔  " .. os.date("%Y/%m/%d %H:%M")
			return {time}
		end,
		oldfiles_directory = false,
		align = "center",
		title = "",
		fold_section = false,
		margin = 0,
		highlight = "TSString",
		default_color = "#FFFFFF",
		oldfiles_amount = 0,
	},
	parts = {
		"header",
		"body",
		"clock",
	},
})
