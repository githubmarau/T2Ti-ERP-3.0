/*
Title: T2Ti ERP Pegasus                                                                
Description: DAO relacionado à tabela [PDV_CONFIGURACAO] 
                                                                                
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
import 'package:drift/drift.dart';
import 'package:pegasus_pdv/src/database/database.dart';
import 'package:pegasus_pdv/src/database/database_classes.dart';

part 'pdv_configuracao_dao.g.dart';

@DriftAccessor(tables: [
  PdvConfiguracaos,
])
class PdvConfiguracaoDao extends DatabaseAccessor<AppDatabase>
    with _$PdvConfiguracaoDaoMixin {
  final AppDatabase db;

  PdvConfiguracaoDao(this.db) : super(db);

  Future<List<PdvConfiguracao>> consultarLista() =>
      select(pdvConfiguracaos).get();

  Future<List<PdvConfiguracao>> consultarListaFiltro(
      String campo, String valor) async {
    final query = " $campo like '%$valor%'";
    final expression = CustomExpression<bool>(query);

    return await (select(pdvConfiguracaos)..where((t) => expression)).get();
  }

  Stream<List<PdvConfiguracao>> observarLista() =>
      select(pdvConfiguracaos).watch();

  Future<PdvConfiguracao?> consultarObjeto(int pId) {
    return (select(pdvConfiguracaos)..where((t) => t.id.equals(pId)))
        .getSingleOrNull();
  }

  Future<int> ultimoId() async {
    final resultado =
        await customSelect("select MAX(ID) as ULTIMO from PDV_CONFIGURACAO")
            .getSingleOrNull();
    return resultado?.data["ULTIMO"] ?? 0;
  }

  Future<int> inserir(PdvConfiguracao pObjeto) {
    return transaction(() async {
      final maxId = await ultimoId();
      pObjeto = pObjeto.copyWith(id: Value(maxId + 1));
      final idInserido = await into(pdvConfiguracaos).insert(pObjeto);
      return idInserido;
    });
  }

  Future<bool> alterar(PdvConfiguracao pObjeto) {
    return transaction(() async {
      return update(pdvConfiguracaos).replace(pObjeto);
    });
  }

  Future<int> excluir(PdvConfiguracao pObjeto) {
    return transaction(() async {
      return delete(pdvConfiguracaos).delete(pObjeto);
    });
  }
}
