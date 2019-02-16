# Docker Firebird
Dokerfile da criação de imagem docker Firebird no CentOS 7.6

*********
Dependências / Arquivos
*********
<< Baixe os seguintes arquivos do site da Oracle >>
-  `instantclient-basic-linux.x64-12.2.0.1.0.zip`
-  `instantclient-sdk-linux.x64-12.2.0.1.0.zip`


*********
Gerando Build
*********
nohup docker build -t helionmendanha/firebird:SS-2.5.8 . &

*********
Executando o container
*********
docker run --name firebird_ss_258 \
	-p 3050:3050 \
	-p 3051:3051 \
	-d helionmendanha/firebird:SS-2.5.8

*********
Acessando o container
*********
docker exec -it firebird_ss_258 bash