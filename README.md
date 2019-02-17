# Docker Firebird
Dokerfile da criação de imagem docker Firebird no CentOS 7.6

*********
### Gerando Build
```
nohup docker build -t helionmendanha/firebird:CS-1.5.6 . &
```

*********
### Executando o container
```
docker run --name firebird_cs_156 -p 3050:3050 -p 3051:3051 -d helionmendanha/firebird:CS-1.5.6
```
*********

### AceCSando o container
```
docker exec -it firebird_cs_156 bash
```