SELECT 
  numero_departamento AS departamento    -- questão 01 mostra a média salarial dos funcionarios 
, AVG(salario)        AS media_salarial
FROM elmasri.funcionario
GROUP BY numero_departamento;


SELECT 
  sexo
, AVG(salario) AS media_salarial    -- questão 02 média salarial de homens e mulheres 
FROM elmasri.funcionario
GROUP BY sexo;


SELECT 
  nome_departamento                  --questão 03 relatorio que lista nome dos departamentos 
, CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome)                                 AS nome_completo_funcionario
, data_nascimento, DATE_PART('year', CURRENT_DATE) - DATE_PART('year', data_nascimento) AS idade
, salario
FROM elmasri.funcionario        f
INNER JOIN elmasri.departamento dp ON (f.numero_departamento = dp.numero_departamento);


SELECT                               --questão 04 mostra o nome completo, idade, e prejuiso de acordo com o salario atual
   CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome)                AS nome_completo_funcionario
 , DATE_PART('year', CURRENT_DATE) - DATE_PART('year', data_nascimento) AS idade
 , salario                                                              AS salario_atual
 , CASE  
          WHEN salario < 35000 THEN salario + salario * 20/100
          WHEN salario >= 35000 THEN salario + salario * 15/100
   END                                                                  AS salario_reajuste
FROM  elmasri.funcionario;


SELECT                                       -- questão 05 listar, para cada departamento, o nome do gerente e do funcionario, nome de departamento (ordem crescente) e salario de funcionario ( ordem decrescente)
  nome_departamento,
  
  CASE 
       WHEN dp.numero_departamento = 1 THEN 'Jorge'
       WHEN dp.numero_departamento = 4 THEN 'Jennifer'
       WHEN dp.numero_departamento = 5 THEN 'Fernando'
  END             AS nome_gerente
 
, primeiro_nome   AS nome_funcionario
, salario         AS salario_funcionario
FROM elmasri.departamento      dp
INNER JOIN elmasri.funcionario f ON (f.numero_departamento = dp.numero_departamento)
ORDER BY nome_departamento ASC, salario DESC;


SELECT                                     --questão 06 mostra nome completo e departamento do funcionario que possui dependente e mostrar todas as informações do dependente 
  CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome)                  AS nome_completo_funcionario
, numero_departamento                                                    AS departamento
, CONCAT(nome_dependente, ' ', ultimo_nome)                              AS nome_completo_dependente
, DATE_PART('year', CURRENT_DATE) - DATE_PART('year', d.data_nascimento) AS idade_dependente

, CASE 
       WHEN d.sexo = 'M' THEN 'Masculino'
       WHEN d.sexo = 'F' THEN 'Feminino'
  END                                                                    AS sexo_dependente
FROM elmasri.funcionario      f
INNER JOIN elmasri.dependente d ON (f.cpf = d.cpf_funcionario);


SELECT DISTINCT     -- Questão 07 mostra nome completo,departamento e salario de cada funcionario que nao possui dependente 
 CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome) AS nome_completo_funcionario
, f. numero_departamento                               AS departamento
, salario
FROM elmasri.funcionario           f
LEFT OUTER JOIN elmasri.dependente d ON (f.cpf = d.cpf_funcionario)
WHERE cpf_funcionario IS NULL;


SELECT         -- Questão 08 mostra os projetos de cada departamento e o nome completo de cada funcionario que esta responsavel pelo projeto, incluindo hora gasta para cada projeto 
  f.numero_departamento                                 AS departamento
, nome_projeto
, CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome) AS nome_completo_funcionario
, SUM(horas)                                            AS horas_por_projeto -- possui a somatoria para a tabela ficar mais legivel 
FROM elmasri.funcionario       f
INNER JOIN elmasri.trabalha_em t ON (f.cpf = t.cpf_funcionario)
INNER JOIN elmasri.projeto     p ON (p.numero_projeto = t.numero_projeto)
WHERE f.cpf = t.cpf_funcionario
GROUP BY departamento, nome_projeto, nome_completo_funcionario 
ORDER BY nome_completo_funcionario;


SELECT                   -- Questão 09 apresenta a soma total das horas de cada projeto respectivo de cada departamento e exibindo o nome do departamento e nome do projeto 
  nome_departamento
, nome_projeto
, SUM(horas) AS soma_horas
FROM elmasri.departamento      dp
INNER JOIN elmasri.projeto     p ON (dp.numero_departamento = p.numero_departamento)
INNER JOIN elmasri.trabalha_em t ON (p.numero_projeto = t.numero_projeto)
GROUP BY nome_departamento, nome_projeto;


SELECT DISTINCT   -- Questão 11 exibe o nome completo do funcionario, nome do projeto e o valor total referente as horas trabalhadas no projeto 
  CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome) AS nome_completo_funcionario
, nome_projeto
, SUM(horas * 50)                                       AS valor_total
FROM elmasri.funcionario       f
INNER JOIN elmasri.projeto     p   ON (f.numero_departamento = p.numero_departamento)
INNER JOIN elmasri.trabalha_em t   ON (p.numero_projeto = t.numero_projeto)
GROUP BY nome_completo_funcionario, nome_projeto
ORDER BY nome_completo_funcionario;


SELECT      --Questão 12 exibe nome do departamento, nome do projeto e nome do funcionario mas nao registrando nem uma hora de trabalho mesmo esntando alocado em algum projeto 
  nome_departamento
, nome_projeto
, primeiro_nome AS nome_funcionario
FROM elmasri.projeto            p
INNER JOIN elmasri.departamento dp ON (p.numero_departamento = dp.numero_departamento)
INNER JOIN elmasri.funcionario  f  ON (p.numero_departamento = f.numero_departamento)
INNER JOIN elmasri.trabalha_em  t  ON (p.numero_projeto = t.numero_projeto)
WHERE t.horas IS NULL OR t.horas = 0;


SELECT      --Questão 13 exibe nome completo do funcionario e dependentes, sexo e idade
  CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome)                AS nome_completo_pessoa
, sexo                                                                 AS sexo
, DATE_PART('year', CURRENT_DATE) - DATE_PART('year', data_nascimento) AS idade
FROM elmasri.funcionario
UNION
SELECT CONCAT(nome_dependente, ' ', f.ultimo_nome)
, d.sexo
, DATE_PART('year', CURRENT_DATE) - DATE_PART('year', d.data_nascimento)
FROM elmasri.dependente        d
INNER JOIN elmasri.funcionario f ON (cpf_funcionario = cpf)
ORDER BY idade DESC;


SELECT       -- Questão 14 exibe nome do departamento e numero de funcionarios de cada departamento 
  nome_departamento AS departamento 
, COUNT(cpf)        AS numero_de_funcionarios
FROM elmasri.funcionario        f
INNER JOIN elmasri.departamento dp ON (f.numero_departamento = dp.numero_departamento)
GROUP BY nome_departamento;


SELECT         -- Questão 15 exibe nome completo do funcionario, departamento e nome do projeto que foi alocado mesmo que o funcionario nao esteja alocado em nem um projeto 
  CONCAT(primeiro_nome,' ', nome_meio,' ', ultimo_nome) AS nome_completo_funcionario
, f.numero_departamento                                 AS departamento
, nome_projeto                                          AS nome_projeto_alocado
FROM elmasri.funcionario        f
LEFT OUTER JOIN elmasri.projeto p ON (f.numero_departamento = p.numero_departamento);

