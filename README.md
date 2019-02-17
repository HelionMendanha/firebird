# Docker Firebird
Dokerfile da criação de imagem docker Firebird no CentOS 7.6

*********
### Gerando Build
```
nohup docker build -t helionmendanha/firebird:SC-2.5.8 . &
```

*********
### Executando o container
```
docker run --name firebird_sc_258 -p 3050:3050 -p 3051:3051 -d helionmendanha/firebird:SC-2.5.8
```
*********

### Acessando o container
```
docker exec -it firebird_sc_258 bash
```