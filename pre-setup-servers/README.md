# pre-setup-servers

Для запуска сервиса достаточно заполнить все нужные переменные в inventory hosts, и запустить баш скрипт:
```
bash run_playbook.sh hosts/<inventory_file>
```
Предварительно добавь свой публичный ключ в files/authorized_keys.

Чтобы восстановить из бекпа базы и данные можно запустить скрипт:
```
bash run_restore.sh hosts/<inventory_file>
```
Чтобы установить node_exporter и filebeat для мониторинга можно запустить скрипт:
```
bash run_setup_monitoring.sh hosts/<inventory_file>
```
