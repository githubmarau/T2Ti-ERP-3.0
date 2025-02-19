/*
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [REQUISICAO_INTERNA_CABECALHO] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:fenix/src/model/model.dart';

class RequisicaoInternaCabecalho {
	int? id;
	int? idColaborador;
	DateTime? dataRequisicao;
	String? situacao;
	Colaborador? colaborador;
	List<RequisicaoInternaDetalhe>? listaRequisicaoInternaDetalhe = [];

	RequisicaoInternaCabecalho({
			id,
			idColaborador,
			dataRequisicao,
			situacao,
			colaborador,
			listaRequisicaoInternaDetalhe,
		});

	static List<String> campos = <String>[
		'ID', 
		'DATA_REQUISICAO', 
		'SITUACAO', 
	];
	
	static List<String> colunas = <String>[
		'Id', 
		'Data da Requisição', 
		'Situação da Requisição', 
	];

	RequisicaoInternaCabecalho.fromJson(Map<String, dynamic> jsonDados) {
		id = jsonDados['id'];
		idColaborador = jsonDados['idColaborador'];
		dataRequisicao = jsonDados['dataRequisicao'] != null ? DateTime.tryParse(jsonDados['dataRequisicao']) : null;
		situacao = getSituacao(jsonDados['situacao']);
		colaborador = jsonDados['colaborador'] == null ? null : Colaborador.fromJson(jsonDados['colaborador']);
		listaRequisicaoInternaDetalhe = (jsonDados['listaRequisicaoInternaDetalhe'] as Iterable?)?.map((m) => RequisicaoInternaDetalhe.fromJson(m)).toList() ?? [];
	}

	Map<String, dynamic> get toJson {
		Map<String, dynamic> jsonDados = <String, dynamic>{};

		jsonDados['id'] = id ?? 0;
		jsonDados['idColaborador'] = idColaborador ?? 0;
		jsonDados['dataRequisicao'] = dataRequisicao != null ? DateFormat('yyyy-MM-ddT00:00:00').format(dataRequisicao!) : null;
		jsonDados['situacao'] = setSituacao(situacao);
		jsonDados['colaborador'] = colaborador == null ? null : colaborador!.toJson;
		

		var listaRequisicaoInternaDetalheLocal = [];
		for (RequisicaoInternaDetalhe objeto in listaRequisicaoInternaDetalhe ?? []) {
			listaRequisicaoInternaDetalheLocal.add(objeto.toJson);
		}
		jsonDados['listaRequisicaoInternaDetalhe'] = listaRequisicaoInternaDetalheLocal;
	
		return jsonDados;
	}
	
    getSituacao(String? situacao) {
    	switch (situacao) {
    		case 'A':
    			return 'Aberta';
    		case 'D':
    			return 'Deferida';
    		case 'I':
    			return 'Indeferida';
    		default:
    			return null;
    		}
    	}

    setSituacao(String? situacao) {
    	switch (situacao) {
    		case 'Aberta':
    			return 'A';
    		case 'Deferida':
    			return 'D';
    		case 'Indeferida':
    			return 'I';
    		default:
    			return null;
    		}
    	}


	String objetoEncodeJson(RequisicaoInternaCabecalho objeto) {
	  final jsonDados = objeto.toJson;
	  return json.encode(jsonDados);
	}
	
}