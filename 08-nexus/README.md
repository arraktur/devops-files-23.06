# Скрипт для развертывания приложения на сервере

```bash
sudo service wordcloud stop

curl -X GET "http://192.168.33.90:8081/repository/word-cloud-build/1/word-cloud-generator/1.$BUILD_NUMBER/word-cloud-generator-1.$BUILD_NUMBER.gz" -o /opt/wordcloud/word-cloud-generator.gz
ls -l /opt/wordcloud
gunzip -f /opt/wordcloud/word-cloud-generator.gz
chmod +x /opt/wordcloud/word-cloud-generator

sudo service wordcloud start
```

## systemd servie /etc/systemd/system/wordcloud.service

```bash
[Unit]
Description=Word Cloud Generator

[Service]
WorkingDirectory=/opt/wordcloud
ExecStart=/opt/wordcloud/word-cloud-generator
Restart=always

[Install]
WantedBy=multi-user.target
```

# Интеграционные тесты
```bash
res=`curl -s -H "Content-Type: application/json" -d '{"text":"ths is a really really really important thing this is"}' http://192.168.33.80:8888/version | jq '. | length'`
if [ "1" != "$res" ]; then
  exit 99
fi

res=`curl -s -H "Content-Type: application/json" -d '{"text":"ths is a really really really important thing this is"}' http://192.168.33.80:8888/api | jq '. | length'`
if [ "7" != "$res" ]; then
  exit 99
fi
```

# Домашнее задание 6

- Добавьте к Vagrantfile еще 3 машины:
  - nexus.vm
  - staging.vm
  - production.vm
- На машине nexus.vm установите Nexus3. Для установки и настройки используйте роль [nexus3-oss](https://github.com/ansible-ThoTeam/nexus3-oss). Роль должна:
  - создавать репозиторий для хранения артефактов сборки
  - создавать отдельный пользователь для загрузки и скачивания данных из репозитория
  - отключать анонимный доступ
- На машинах staging.vm и production.vm создайте условия для установки и настройки службы word-cloud-generator(systemd service, directory)
- В пайплайн Jenkins добавьте шаги по установке сервиса на staging, тестирование и установку на production.
- IP адреса серверов (Nexus, staging, production) пропишите через переменные
- Имя пользователя и пароль для доступа к Nexus и Staging/Production так же должны быть прописаны через переменные.


# Полезные ссылки

- [Nexus3 downloads](https://help.sonatype.com/repomanager3/product-information/download)
- [Пошаговая инструкция по настройке Jenkins Node](https://wiki.jenkins.io/display/JENKINS/Step+by+step+guide+to+set+up+master+and+agent+machines+on+Windows)
- [Инструкция по настройке Master/Slave](https://www.howtoforge.com/tutorial/ubuntu-jenkins-master-slave/)
- https://www.sonatype.com
- [Ansible роль nexus3-oss](https://github.com/ansible-ThoTeam/nexus3-oss)