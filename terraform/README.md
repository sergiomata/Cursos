## variables
1. declarar variables de entorno

export TF_VAR_nombrevariable="hola"


2. declarar variables en plan

terraform plan -var nombre_variable="adios"

### verificar variables de entorno

env | grep TF

### quitar variables de entorno

unset TF_VAR_nombrevariable

## nombres permitidos para guardar variables

Si permitido: terraform.tfvars, terraform.tfvars.json
              *.auto.tfvars *.auto.tfvars.json

No permitido terraform. *.tfvars

si lo seas asi seria terraform plan --var-file *.tfvars

## prioridad en las variables

1. terraform plan -var (linea de comandos)
2. *.auto.tfvars
3. terraform.tfvars
4. variable de entorno


#### para graficas

terraform graph

# visualizar grafica

terraform graph | dot -Tsvg > graph.svg


### terraform state

para listar: terraform state list

para mostrar todo: terraform show

para solo uno terraform state show "elemento"

# para cambiar el nombre de un recurso en terraform 

terraform state move SOURCE DESTINATION

# borrar recursos en state (no los creados ni en el plan)

terraform state rm RESOURCE

# para dar formato

terraform fmt

# para marcar un recurso para borrarlo

terraform taint RESOURCE

# para desmarcarlo

terraform untaint RESOURCE

ahora es 

terraform apply --replace


### logs en terraform

export TF_LOG=TRACE

export TF_LOG_PATH=terra_log.txt

## terraform import

terraform import resource id

## workspaces
terraform workspace list

terraform workspace new Nombre

terraform workspace new select Nombre

## terraform para traerlo de manera local 

terraform state pull > terraform.tfstate

