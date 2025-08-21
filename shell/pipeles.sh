Pipelines, often called pipes, is a way to chain commands and connect output from one command to the input of the next. A pipeline is represented by the pipe character: |. It's particularly handy when a complex or long input is required for a command.

command1 | command2
By default pipelines redirects only the standard output, if you want to include the standard error you need to use the form |& which is a short hand for 2>&1 |.

Example:

Imagine you quickly want to know the number of entries in a directory, you can use a pipe to redirect the output of the ls command to the wc command with option -l.

ls / | wc -l
Then you want to see only the first 10 results

ls / | head
Note: head outputs the first 10 lines by default, use option -n to change this behavior

Grep searches for patterns in each file. Patterns is one or more patterns separated by newline characters, and grep prints each line that matches a pattern. Typically patterns should be quoted when grep is used in a shell command.

ls / | grep  # This will grab any line/file that has a matching pattern in it



Guardar salida y errores en un archivo:
comando > salida.txt 2>&1
→ Guarda tanto la salida normal como los errores en salida.txt.
Redirigir ambos flujos a null (para silenciar todo):
comando > /dev/null 2>&1
→ No verás ni la salida ni los errores.
Pasar errores también por un pipe:
comando 2>&1 | grep "error"
→ Busca la palabra “error” tanto en la salida normal como en los mensajes de error.