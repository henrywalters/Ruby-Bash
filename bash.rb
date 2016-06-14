require_relative "depend.rb"


$running = true



def clear()
	system "clear" or system "cls"
end

def kill()
	$running = false
end

def parse(input_hash)
	cmd = input_hash[:commands]
	vars = input_hash[:variables]

	if $alias.include? cmd
		cmd = $alias[cmd]
	end

	if $cmds.include? cmd
		if $cmds[cmd][:variables] == vars.length
			if vars.length > 0
				eval ($cmds[cmd][:exec] + "'" + vars.join("','") + "'" + ")")
			else
				eval ($cmds[cmd][:exec] + ")")
			end
		elsif $cmds[cmd][:variables] == -1
			if vars.length == 0
				puts "Expected atleast one variable"
			else
				eval ($cmds[cmd][:exec] + "vars)")
			end
		else
			puts "Expected " + $cmds[cmd][:variables].to_s + " Parameters, " + vars.length.to_s + " Were Given"
		end
	else
		puts "Invalid Command"
	end


end

def listen()
	print $user + $comp + $prefix + " "
	input = gets
	return input
end

def lex(input)
	input = input.split()
	commands = []
	variables = []
	vars = false
	for i in input 
		if not vars
			if i == $var_token
				vars = true
			else
				commands.push(i)
			end
		else
			variables.push(i)
		end
	end
	return {:commands => commands.join(" "), :variables => variables}
end

def set_user(new_user)
	$user = new_user
end

def set_comp(new_comp)
	$comp = new_comp
end

def set_prefix(new_prefix)
	$prefix = new_prefix
end


clear()

while $running
	parse(lex(listen()))
end