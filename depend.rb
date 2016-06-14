####### Add all of your functions here

####### Note bash variables will come as strings!!!

$cmds = {

	### Bash Commands

	"set user" => {:variables => 1, :exec => "set_user("},
	"set comp" => {:variables => 1, :exec => "set_comp("},
	"set prefix" => {:variables => 1, :exec => "set_prefix("},
	"kill" => {:variables => 0, :exec => "kill("},

	### Custom Commands

	"add" => {:variables => 2, :exec => "add("},
	"sum" => {:variables => -1, :exec => "add_all("},
	"average" => {:variables => -1, :exec => "avg("},
	"mult" => {:variables => 2, :exec => "mult("},
	"div" => {:variables => 2, :exec => "div("},
}

### Add alias as so!

$alias = {
	"su" => "set user",
	"sc" => "set comp",
	"sp" => "set prefix",
}

### Change the way the bash looks!

$user = ""
$comp = ""
$prefix = ">>>"

$var_token = '|'


def add(num1, num2)
	num1 = num1.to_f
	num2 = num2.to_f

	puts (num1+num2).to_s
end

def add_all(array)
	sum = 0
	for i in array
		i = i.to_f
		sum += i
	end
	puts sum.to_s
end

def avg(array)
	sum = 0
	for i in array
		i = i.to_f
		sum += i
	end
	puts sum / ( array.length.to_f  )
end

def mult(num1,num2)
	puts num1.to_f * num2.to_f
end

def div(num1,num2)
	puts num1.to_f/num2.to_f
end