Welcome to Ruby Bash!

This tool is a way to quickly start using a custom command line interface.
To change the way your bash works, simply modify the depend.rb file appropriatly.

1.) Using Bash
Currently, the bash format is extremely simple. The basic format of every command is:

>>> foo bar | var1 var2

where foo bar would be the command, taking the parameters var1 and var2, Seperated by the pipeline.

2.) Customizing

To change the way the bash looks, simply run the set user, set comp, and set prefix commands.

>>> set user | ruby
ruby>>> set comp | @rocks
ruby@rocks>>> set prefix | :~$
ruby@rocks:~$ 

Or you can change the following lines in depend.rb,

$user = ""
$comp = ""
$prefix = ">>>"

to whatever you please.

3.) Creating your own Commands

This is the true meat of the code, the simplicity of adding commands to your own bash. 
The two step process is as follows.

Define a function in the depend.rb file. The bash will pass either n amount of variables, or an array. 
Note that the variables, or elements in the array will all be strings.

Now you must add the appropriate hash to the hash table in depend.rb called $cmds of the form:
"bash command" => {:variables = integer, :exec = function_name}
Note 1 : if you wish to pass an array, set variables to -1.
Note 2: Your function name must look like "function_name(" without the end parathenesis.

You're now ready to start using your own custom Command Line!



