\copy (
SELECT
    c."IDCREDITO",
    c."Valor",
    c."Duracao",
    c."TempoParcelamento",
    c."ResidenciaDesde",
    c."Idade",
    c."EmprestimoExistente",
    c."Dependentes",
    c."SocioEmpresa",
    c."Estrangeiro",
    c."Status",
    hc.historico,
    p.proposito,
    i.investimento,
    e.emprego,
    ec.descricao,
    f.descricao,
    ofin.outrosfinanciamentos,
    h.tipohabitacao,
    prof.nomeprofissao
FROM "CREDITO" c
LEFT JOIN historico_credito hc ON c."HistoricoCredito" = hc.idhistcred
LEFT JOIN propositos p ON c."Proposito" = p.idproposito
LEFT JOIN investimentos i ON c."Investimentos" = i.idinvestimentos
LEFT JOIN empregos e ON c."Emprego" = e.idemprego
LEFT JOIN estadocivil ec ON c."EstadoCivil" = ec.idestadocivil
LEFT JOIN fiador f ON c."FiadorTerceiros" = f.idfiador
LEFT JOIN outrosfinanciamentos ofin ON c."OutrosFinanciamentos" = ofin.idoutrosfinanc
LEFT JOIN habitacao h ON c."Habitacao" = h.idhabitacao
LEFT JOIN profissoes prof ON c."Profissao" = prof.idprofissao
) TO STDOUT WITH CSV HEADER;
