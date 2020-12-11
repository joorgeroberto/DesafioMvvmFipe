# Consultar a tabela Fipe usando dados de uma API
## Digital House - Turma 01 - IOS (Swift)

Exercício para o curso da Digital House: IOS usando Swift promovido pelo Programa Santander Coders.<br />

* Esta aplicação foi desenvolvida com o objetivo de praticar conceitos como:
    - Implementação utilizando o padrão de projeto Mvvm.
    - Consulta de dados de uma API (foi utilizado Alamofire do Cocoapods). 


### Requisitos Principais:

* Na primeira tela, listar as marcas: 
    - https://parallelum.com.br/fipe/api/v1/carros/marcas
* Ao selecionar uma marca, listar os Modelos da marca selecionada: 
    - https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos
* Quando selecionar um modelo, listar os anos: 
    - https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos/437/anos
* Ao selecionar o ano, finalmente vai poder exibir as informações do veículo: 
    - https://parallelum.com.br/fipe/api/v1/carros/marcas/21/modelos/437/anos/1987-1


### OBS: Para praticar e facilitar a consulta dos dados, uma barra de pesquisa foi adicionada. 

### Preview: <br>
<img src="https://github.com/joorgeroberto/DesafioMvvmFipe/blob/master/1113_TvMazeApi/appVideo.gif" width="300" />
