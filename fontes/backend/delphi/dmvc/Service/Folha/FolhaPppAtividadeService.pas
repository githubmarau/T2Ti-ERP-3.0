{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_PPP_ATIVIDADE] 
                                                                                
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
*******************************************************************************}
unit FolhaPppAtividadeService;

interface

uses
  FolhaPppAtividade, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaPppAtividadeService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFolhaPppAtividade>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPppAtividade>;
    class function ConsultarObjeto(AId: Integer): TFolhaPppAtividade;
    class procedure Inserir(AFolhaPppAtividade: TFolhaPppAtividade);
    class function Alterar(AFolhaPppAtividade: TFolhaPppAtividade): Integer;
    class function Excluir(AFolhaPppAtividade: TFolhaPppAtividade): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaPppAtividadeService }



class function TFolhaPppAtividadeService.ConsultarLista: TObjectList<TFolhaPppAtividade>;
begin
  sql := 'SELECT * FROM FOLHA_PPP_ATIVIDADE ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPppAtividade>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPppAtividadeService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaPppAtividade>;
begin
  sql := 'SELECT * FROM FOLHA_PPP_ATIVIDADE where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaPppAtividade>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaPppAtividadeService.ConsultarObjeto(AId: Integer): TFolhaPppAtividade;
begin
  sql := 'SELECT * FROM FOLHA_PPP_ATIVIDADE WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaPppAtividade>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaPppAtividadeService.Inserir(AFolhaPppAtividade: TFolhaPppAtividade);
begin
  AFolhaPppAtividade.ValidarInsercao;
  AFolhaPppAtividade.Id := InserirBase(AFolhaPppAtividade, 'FOLHA_PPP_ATIVIDADE');
  
end;

class function TFolhaPppAtividadeService.Alterar(AFolhaPppAtividade: TFolhaPppAtividade): Integer;
begin
  AFolhaPppAtividade.ValidarAlteracao;
  Result := AlterarBase(AFolhaPppAtividade, 'FOLHA_PPP_ATIVIDADE');
  
  
end;


class function TFolhaPppAtividadeService.Excluir(AFolhaPppAtividade: TFolhaPppAtividade): Integer;
begin
  AFolhaPppAtividade.ValidarExclusao;
  
  Result := ExcluirBase(AFolhaPppAtividade.Id, 'FOLHA_PPP_ATIVIDADE');
end;


end.
