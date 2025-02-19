{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [FOLHA_INSS_SERVICO] 
                                                                                
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
unit FolhaInssServicoService;

interface

uses
  FolhaInssServico, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TFolhaInssServicoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TFolhaInssServico>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaInssServico>;
    class function ConsultarObjeto(AId: Integer): TFolhaInssServico;
    class procedure Inserir(AFolhaInssServico: TFolhaInssServico);
    class function Alterar(AFolhaInssServico: TFolhaInssServico): Integer;
    class function Excluir(AFolhaInssServico: TFolhaInssServico): Integer;
  end;

var
  sql: string;


implementation

{ TFolhaInssServicoService }



class function TFolhaInssServicoService.ConsultarLista: TObjectList<TFolhaInssServico>;
begin
  sql := 'SELECT * FROM FOLHA_INSS_SERVICO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TFolhaInssServico>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaInssServicoService.ConsultarListaFiltro(AWhere: string): TObjectList<TFolhaInssServico>;
begin
  sql := 'SELECT * FROM FOLHA_INSS_SERVICO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TFolhaInssServico>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TFolhaInssServicoService.ConsultarObjeto(AId: Integer): TFolhaInssServico;
begin
  sql := 'SELECT * FROM FOLHA_INSS_SERVICO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TFolhaInssServico>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TFolhaInssServicoService.Inserir(AFolhaInssServico: TFolhaInssServico);
begin
  AFolhaInssServico.ValidarInsercao;
  AFolhaInssServico.Id := InserirBase(AFolhaInssServico, 'FOLHA_INSS_SERVICO');
  
end;

class function TFolhaInssServicoService.Alterar(AFolhaInssServico: TFolhaInssServico): Integer;
begin
  AFolhaInssServico.ValidarAlteracao;
  Result := AlterarBase(AFolhaInssServico, 'FOLHA_INSS_SERVICO');
  
  
end;


class function TFolhaInssServicoService.Excluir(AFolhaInssServico: TFolhaInssServico): Integer;
begin
  AFolhaInssServico.ValidarExclusao;
  
  Result := ExcluirBase(AFolhaInssServico.Id, 'FOLHA_INSS_SERVICO');
end;


end.
