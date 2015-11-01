1. Selecionar visitantes que nasceram antes de 1980.

select nome
from visitante
where Data_de_nascimento < '1980-01-01';

2. Consultar os nomes dos visitanets que fazer parte de excursão de ID = 1.

SELECT nome 
FROM visitante
WHERE ID_visitante IN ( SELECT id_visitante
                        FROM pertence
                        WHERE ID_excursao = 1);
 
3. Consultar todos os funcionario que trabalham na entrada, e nao atenderam a Marcela Terakado.

select nome
from funcionario
where ID_funcionario in (select ID_funcionario
                         from entrada)
      and 
      ID_funcionario not in (select ID_funcionario
                             from entrada
                             where ID_visitante = (select ID_visitante
                                                   from visitante
                                                   where nome = 'Marcela Terakado'));                         
               
4. Consultar os nomes populares dos animais que são estudadas pelo projeto "Os animais".
               
select Nome_popular
from especie
where ID_especie IN (select ID_especie_estudada
                     from estudada
                     where ID_projeto = (select ID_projeto
                                         from projeto 
                                         where Titulo = 'Os animais'));
                        
5. Pegar os nomes dos visitantes que visitaram todos os parques.

select nome
from visitante as v
where not exists ( select *
                   from parque_ecologico
                   where ID_parque not in ( select ID_parque
                                            from entrada as e
                                            where v.ID_visitante = e.ID_visitante));
                                            
