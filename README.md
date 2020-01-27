# otus_devops
Разворачивание инстанса в gcp происходит с помощью Terraform
необходимо в файле terraform.tfvars определить переменные:
project = "ID проекта в GCP"
region = "Регион создания инстанса"
zone = "Зона создания инстанса"
machine_type = "Тип инстанса"
disk_image = "Образ ОС для создания инстанса"
ssh_user = "Пользователь SSH для подключения"
private_key_path = "Путь до приватного ssh ключа"
public_key_path = "Путь до публичного ssh ключа"

