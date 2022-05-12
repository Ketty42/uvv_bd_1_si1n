insert into elmasri.funcionario values (
'88866555576', 'Jorge', 'E', 'Brito', 
'1937-11-10','Rua do Horto, 35, São Paulo,SP', 'M', 
'55000', NULL, '1');

insert into elmasri.funcionario values (
'33344555587', 'Fernando', 'T', 'Wong', 
'1955-12-08','Rua da Lapa, 34, São Paulo,SP', 'M', 
'40000', '88866555576', '5');

insert into elmasri.funcionario values (
'98765432168', 'Jennifer', 'S', 'Souza', 
'1941-06-20','Av.Arthur de Lima, 54, Santo André,SP', 'F', 
'43000', '88866555576', '4');

insert into elmasri.funcionario values (
'98798798733', 'André', 'V', 'Pereira', 
'1969-03-29','Rua Timbira, 35, São Paulo,SP', 'M', 
'25000', '98765432168', '4');

insert into elmasri.funcionario values (
'45345345376', 'Joice', 'A', 'Leite', 
'1972-07-31','Av.Lucas Obes, 74, São Paulo,SP', 'F', 
'25000', '33344555587', '5');

insert into elmasri.funcionario values (
'66688444476', 'Ronaldo', 'K', 'Lima', 
'1962-09-15','Rua Rebouças, 65, Piracicaba,SP', 'M', 
'38000', '33344555587', '5');

insert into elmasri.funcionario values (
'99988777767', 'Alice', 'J', 'Zelaya', 
'1968-01-19','Rua Souza Lima, 35, Curitiba,PR', 'F', 
'25000', '98765432168', '4');

insert into elmasri.funcionario values (
'12345678966', 'João', 'B', 'Silva', 
'1965-01-09','Rua das Flores, 751, São Paulo,SP', 'M', 
'30000', '33344555587', '5');

insert into elmasri.departamento values (
'5', 'Pesquisa', '33344555587', '1988-05-22'
); 

insert into elmasri.departamento values (
'4', 'Administração', '98765432168', '1995-01-01'
); 

insert into elmasri.departamento values (
'1', 'Matriz', '88866555576', '1981-06-19'
); 

insert into elmasri.localizacoes_departamento values (
'1', 'São Paulo'
); 

insert into elmasri.localizacoes_departamento values (
'4', 'Mauá'
); 

insert into elmasri.localizacoes_departamento values (
'5', 'Santo André'
); 

insert into elmasri.localizacoes_departamento values (
'5', 'Itu'
); 

insert into elmasri.localizacoes_departamento values (
'5', 'São Paulo'
); 

insert into elmasri.projeto values (
'1', 'ProdutoX', 'Santo André', '5'
); 

insert into elmasri.projeto values (
'2', 'ProdutoY', 'Itu', '5'
); 

insert into elmasri.projeto values (
'3', 'ProdutoZ', 'São Paulo', '5'
); 

insert into elmasri.projeto values (
'10', 'Informatização', 'Mauá', '4'
); 

insert into elmasri.projeto values (
'20', 'Reorganização', 'São Paulo', '1'
); 

insert into elmasri.projeto values (
'30', 'Novosbenefícios', 'Mauá', '4'
); 

insert into elmasri.dependente values (
'33344555587', 'Alicia', 'F', '1986-04-05','Filha'
); 

insert into elmasri.dependente values (
'33344555587', 'Tiago', 'M', '1983-10-25','Filho'
); 

insert into elmasri.dependente values (
'33344555587', 'Janaína', 'F', '1958-05-03','Esposa'
); 

insert into elmasri.dependente values (
'98765432168', 'Antonio', 'M', '1942-02-28','Marido'
); 

insert into elmasri.dependente values (
'12345678966', 'Michael', 'M', '1988-01-04','Filho'
); 

insert into elmasri.dependente values (
'12345678966', 'Alicia', 'F', '1988-12-30','Filha'
); 

insert into elmasri.dependente values (
'12345678966', 'Elizabeth', 'F', '1967-05-05','Esposa'
); 

insert into elmasri.trabalha_em values (
'12345678966', '1', '32.5');

insert into elmasri.trabalha_em values (
'12345678966', '2', '7.5');

insert into elmasri.trabalha_em values (
'66688444476', '3', '40.0');

insert into elmasri.trabalha_em values (
'45345345376', '1', '20.0');

insert into elmasri.trabalha_em values (
'45345345376', '2', '20.0');

insert into elmasri.trabalha_em values (
'33344555587', '2', '10.0');

insert into elmasri.trabalha_em values (
'33344555587', '3', '10.0');

insert into elmasri.trabalha_em values (
'33344555587', '10', '10.0');

insert into elmasri.trabalha_em values (
'33344555587', '20', '10.0');

insert into elmasri.trabalha_em values (
'99988777767', '30', '30.0');

insert into elmasri.trabalha_em values (
'99988777767', '10', '10.0');

insert into elmasri.trabalha_em values (
'98798798733', '10', '35.0');

insert into elmasri.trabalha_em values (
'98798798733', '30', '5.0');

insert into elmasri.trabalha_em values (
'98765432168', '30', '20.0');

insert into elmasri.trabalha_em values (
'98765432168', '20', '15.0');

insert into elmasri.trabalha_em values (
'88866555576', '20', NULL);


