# Projeto de Banco de Dados Turístico

Este projeto contém um banco de dados MySQL desenvolvido para gerenciar passeios turísticos, incluindo informações sobre capitães, escunas, destinos, e medicamentos para os passageiros.
![Visualização da tabla](todatabela.png)


## Estrutura do Banco de Dados

O banco de dados é composto por várias tabelas inter-relacionadas que armazenam diferentes tipos de dados. A seguir estão as tabelas e suas descrições:

### 1. Tabela `capitao` 
![Tabela capitao](capitao.png) <br>

Armazena informações dos capitães responsáveis pelas escunas.
| CPF | Nome| Endereço | Número | Celular |
|-------------|-------------|-------------|------------|-----------|
| Chave primária| Nome do Capitão | Endereço do Capitão  | Número da residência | Número do celular|
| Tipo: bigint| Tipo: varchar| Tipo: varchar | Tipo: int | Tipo: int | Tipo: bigint|
<br>

### 2. Tabela `escuna`
![Tabela escuna](escuna.png) <br>
Armazena informações das escunas (barcos) utilizadas nos passeios.
| Número | Nome | capitao_CPF |
|----------|----------|----------|
| Chave primária | Nome da escuna | Chave estrangeira que referencia o CPF do capitão |
| Tipo: int| Tipo: varchar | Tipo: bigint |
<br>

### 3. Tabela `destino`
![Tabela destino](destino.png) <br>
Armazena os destinos turísticos disponíveis.
| id | Nome |
|----------|----------|
| Chave primária com auto-incremento | Nome do destino |
| Tipo: int | Tipo: varchar |
<br>

### 4. Tabela `passeio`
![Tabela passeio](passeio.png) <br>
Registra os passeios realizados, incluindo data, horário, escuna, e destino.
| Id | Data | Hr_saida | Hr_chegada | escuna_Numero | destino_Id |
|----------|----------|----------|----------|----------|----------|
| Chave primária com auto-incremento | Data do passeio | Hora de saída | Hora de chegada | Chave estrangeira que referencia a escuna | Chave estrangeira que referencia o destino | 
| Tipo: int | Tipo: date | Tipo: time | Tipo: time | Tipo: int | Tipo: int |
<br>


### 5. Tabelas Relacionadas à Saúde
- **`Enfermeiro`**: 
  ![Tabela enfermeiro](enfermeiro.png) <br>
  Armazena informações dos enfermeiros responsáveis pela administração de medicamentos.<br>
  | coren | Nome |
  |--------|---------|
  | Chave primária | Nome do enfermeiro |
  | tipo: int | tipo: varchar |
  <br>
  
  
- **`Paciente`**: Registra informações dos pacientes.<br>
  ![Tabela paciente](paciente.png)
  | Num | Nome |
  |-----------|-----------|
  | Chave primária | Nome do Paciente |
  | tipo: int | Tipo: varchar |
  <br>
  
- **`Remedio`**: Contém os medicamentos disponíveis.<br>
![tabela remedio](remedio.png)

| Cod | Nome |
|----------|----------|
| Chave primária | Nome do medicamento|
| Tipo: int | Tipo: varchar | 
<br>

- **`Medicacao`**: Registra a administração de medicamentos, relacionando pacientes, enfermeiros e remédios.<br>
![Tabela medicação](medicacao.png)

| id | Data | Hora | PacienteNum | RemedioCod | Enfermeirocoren |
|----------|-----------|------------|---------------|-------------------|-------------------|
| Chave primária | Data da medicação | Hora da medicação | Chave estrangeira que referencia o paciente | Chave estrangeira que referencia  o remédio | Chave estrangeira que referencia  o enfermeiro |
| Tipo: int | Tipo: Date | Tipo: Time | Tipo: int | Tipo: int | Tipo: int |

### 6. Tabela `Vendas`
Armazena informações sobre vendas de pacotes turísticos.
- **Número**: Chave primária com auto-incremento (int)
- **DestinoId**: Chave estrangeira que referencia o destino (int)
- **Embarque**: Data de embarque (date)
- **Qtd**: Quantidade de pacotes vendidos (int)






