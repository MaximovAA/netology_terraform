# Домашнее задание к занятию «Использование Terraform в команде»

### Задание 1

1. Возьмите код:
- из [ДЗ к лекции 4](https://github.cd..com/netology-code/ter-homeworks/tree/main/04/src),
- из [демо к лекции 4](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1).
2. Проверьте код с помощью tflint и checkov. Вам не нужно инициализировать этот проект.
3. Перечислите, какие **типы** ошибок обнаружены в проекте (без дублей).

![sec](https://github.com/MaximovAA/school/blob/main/tlint.jpg "Пример вывода команд")

```
На указанном скриншоте 3 типа предупреждений
- Использование ветки main
- Отсутствие версии провайдера
- Неиспользуемые переменные
```
------

### Задание 2

1. Возьмите ваш GitHub-репозиторий с **выполненным ДЗ 4** в ветке 'terraform-04' и сделайте из него ветку 'terraform-05'.
2. Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.
3. Закоммитьте в ветку 'terraform-05' все изменения.
4. Откройте в проекте terraform console, а в другом окне из этой же директории попробуйте запустить terraform apply.
5. Пришлите ответ об ошибке доступа к state.
6. Принудительно разблокируйте state. Пришлите команду и вывод.

![sec](https://github.com/MaximovAA/school/blob/main/backet.jpg "Пример вывода команд")
![sec](https://github.com/MaximovAA/school/blob/main/srv_role.jpg "Пример вывода команд")
![sec](https://github.com/MaximovAA/school/blob/main/ydb.jpg "Пример вывода команд")
![sec](https://github.com/MaximovAA/school/blob/main/state-lock.jpg "Пример вывода команд")
![sec](https://github.com/MaximovAA/school/blob/main/unlock.jpg "Пример вывода команд")

------
### Задание 3  

1. Сделайте в GitHub из ветки 'terraform-05' новую ветку 'terraform-hotfix'.
2. Проверье код с помощью tflint и checkov, исправьте все предупреждения и ошибки в 'terraform-hotfix', сделайте коммит.
3. Откройте новый pull request 'terraform-hotfix' --> 'terraform-05'. 
4. Вставьте в комментарий PR результат анализа tflint и checkov, план изменений инфраструктуры из вывода команды terraform plan.
5. Пришлите ссылку на PR для ревью. Вливать код в 'terraform-05' не нужно.

[Ссылка на Pull Request](https://github.com/MaximovAA/netology_terraform/pull/1 "Пример вывода команд")  

[Ссылка на ветку Terraform-05](https://github.com/MaximovAA/netology_terraform/tree/Terraform-05 "Пример вывода команд")

------
### Задание 4

1. Напишите переменные с валидацией и протестируйте их, заполнив default верными и неверными значениями. Предоставьте скриншоты проверок из terraform console. 

- type=string, description="ip-адрес" — проверка, что значение переменной содержит верный IP-адрес с помощью функций cidrhost() или regex(). Тесты:  "192.168.0.1" и "1920.1680.0.1";
- type=list(string), description="список ip-адресов" — проверка, что все адреса верны. Тесты:  ["192.168.0.1", "1.1.1.1", "127.0.0.1"] и ["192.168.0.1", "1.1.1.1", "1270.0.0.1"].

![sec](https://github.com/MaximovAA/school/blob/main/Check_ip.jpg "Пример вывода команд")
![sec](https://github.com/MaximovAA/school/blob/main/check_ip_list.jpg "Пример вывода команд")  

```hcl
variable "test_ip_address" {
    type          = string
    description   = "Example to validate IP address."
    validation {
        condition = can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",var.test_ip_address))
        error_message = "Invalid IP address provided."
    }
}

variable "test_ip_address_list" {
    type          = list(string)
    description   = "Example to validate IP address."
    validation {
        condition =  alltrue([
        for a in var.test_ip_address_list : can(regex("^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$",a))
        ])
        error_message = "Invalid IP address provided."
    }
}
```


------

