# otus_devops
Создание сервера приложения и бд в облаке gcp при помощи packer, terraform и ansible

1. - Создаем образы ОС в Packer
1.1 - Переходим в директорию packer 
      cd ~/infra/packer
1.2 - Определяем переменные в app.json & db.json
	"project_id" — Имя проекта в gcp
1.3 — Запускаем билд образов:
	packer build app.json
	packer build db.json

2. - После завершения билда образов переходим в директорию terrafrm
	cd ~/infra/terraform
2.1 — в директория ./prod и ./stage создаем terraform.tfvars и определяем переменные:
	project = "Имя проекта в gcp"
	private_key_path = "путь до приветного ssh  ключа"
	public_key_path = "путь до публичного ssh ключа"

	В файлах ./prod/main.tf и ./stage/main.tf указаны используемые модули
- app — модуль создания инстанса приложения
- db — модуль создания инстанса бд
- vpc — модуль создания правил firewall
2.2 — переходим в директори stage или prod и создаем инстансы коммандой:
	terraform apply -auto-approve=false

3. переходим в директориб ansible
	cd ~/infra/ansible
В директории:
	./app — роль севера приложения
	./db — роль сервера бд
	./environments — переменные для prod и stage среды
	./ansible.cfg -  конфигурация дефолтных параметров ansible
	./site.yml — основной плейбук
	./app.yml — плейбук сервера приложения
	./db/yml — плейбук сервера бд
	./deploy.yml — плейбук деплоя приложения
	./packer_reddit_{app,db}.yml — плейбуки создания образов packer
3.1 изменить переменные в зависимости от среды  prod или stqage в директориях:
	./environments/prod
	./environments/stage
в файле hosts указать ip адреса серверов
в файле app указать внутренний ip адрес сервера db

