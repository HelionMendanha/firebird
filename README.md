# Docker Firebird
Dokerfile da criação de imagem docker Firebird no CentOS 7.6

*********
### Gerando Build
```
nohup docker build -t helionmendanha/firebird:SS-1.5.6 . &
```
*********

*********
### Executando o container
```
docker run --name firebird_ss_156 -p 3050:3050 -p 3051:3051 -d helionmendanha/firebird:SS-1.5.6
```
*********

*********
### Acessando o container
```
docker exec -it firebird_ss_156 bash
```
*********
