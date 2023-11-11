# Инфраструктура на виртуальных серверах для Web
![Project](https://github.com/EvilMeatOo/otus-project/assets/99479159/46b766be-0b87-41e4-bd19-1f2f3e2679a0)

Инфраструктура для Web разорачивается с помощью ansible. Вирутальные серверы поднимаются с помощью Vagrant. В качестве операционной сисемы используется CentOS 7. На виртуальных серверах поднимаются сервисы мониторинга, логирования, базы данных и frontend с backend. Выполняется резервное копирование важных компонентов. Вся инфраструктура работает в приватной сети. Интернет доступен только через frontend. 
1. Frontend выполняет функции кеширования WEB с помощью NGINX для нивелирования нагрузки на Backend. Трафик WEB шифруется с помощью HTTPS. Frontend также выполняет роль прокси в интернет для всех остальных серверов. На вход установлен iptables.  
2. Backend выполняет функции источника данных WEB для Frontend сервера. Для web используется NGINX + PHP и WordPress.  Для сохранности данных WordPress раз в 30 минут выполняется копирование данных на Backup сервер. Для копирования используется bash скрипт и cron. В качестве базы данных для WordPress выступает MySQL, который размещен на Database сервере. 
3. Database выполняется функции сервера с базой MySQL для WordPress. Для сохранности данных MySQL раз в 30 минут выполняется копирование данных на Backup сервер. Для копирования используется bash скрипт и cron.
4. Monitoring сервер выполняет функции мониторинга состояния всех серверов. Используется Prometheus + Alertmanager. Алерты отправляются через Телеграм при помощи бота @MiddlemanBot. Для построения графиков используется Grafana. Источником данных для Prometheus является node_exporter, который устанавливается на все серверы. Для Database дополнительно устанавливается mysqld_exporter. Для сохранности графиков Grafana раз в 30 минут выполняется копирование данных на Backup сервер. Для копирования используется bash скрипт и cron.
5. Elk сервер выполняет функции хранения и обработки логов со всех серверов. Используется stack ELK (Elasticsearch, Logstash, Kibana). Источником данных для ELK является Filebeat, который устанавливается на все серверы.
6. Вackup сервер выполняет функции хранения файлов WordPress. Базы данных MySQL. Базы Grafana. При необходимости с этого сервера можно выполнить восстановление данных.
```
Для поднятия инфраструктуры нужно воспользоваться плейбуком из директории pre-setup-servers.
```
