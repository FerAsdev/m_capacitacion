
select * from REQUI_INTERNA

select * from requi_oficinas order by id_requi asc

select * from siuc_oficinas

select * from REQUI_AUDITORIA

select * from auditoria_oficinas order by id_req_auditoria asc

select IDENT_CURRENT ('REQUI_AUDITORIA')

select IDENT_CURRENT ('REQUI_INTERNA');

select * from REQUI_INTERNA


--Consulta para obtener el nombre de las oficinas seleccionadas desde modulo req_interna.
select  siuc_oficinas.oficina 
from siuc_oficinas 
where siuc_oficinas.id_oficina 
in (select requi_oficinas.id_oficina from requi_oficinas where id_requi=23)
order by oficina asc

--Consulta para obtener el nombre de las oficinas seleccionadas desde modulo auditoria.
select  siuc_oficinas.oficina 
from siuc_oficinas 
where siuc_oficinas.id_oficina 
in (select auditoria_oficinas.id_oficina from auditoria_oficinas where ID_REQ_AUDITORIA=13)
order by oficina asc