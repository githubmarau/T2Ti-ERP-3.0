{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [CONTABIL_CONTA_RATEIO] 
                                                                                
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
unit ContabilContaRateioService;

interface

uses
  ContabilContaRateio, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TContabilContaRateioService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TContabilContaRateio>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TContabilContaRateio>;
    class function ConsultarObjeto(AId: Integer): TContabilContaRateio;
    class procedure Inserir(AContabilContaRateio: TContabilContaRateio);
    class function Alterar(AContabilContaRateio: TContabilContaRateio): Integer;
    class function Excluir(AContabilContaRateio: TContabilContaRateio): Integer;
  end;

var
  sql: string;


implementation

{ TContabilContaRateioService }



class function TContabilContaRateioService.ConsultarLista: TObjectList<TContabilContaRateio>;
begin
  sql := 'SELECT * FROM CONTABIL_CONTA_RATEIO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TContabilContaRateio>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilContaRateioService.ConsultarListaFiltro(AWhere: string): TObjectList<TContabilContaRateio>;
begin
  sql := 'SELECT * FROM CONTABIL_CONTA_RATEIO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TContabilContaRateio>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TContabilContaRateioService.ConsultarObjeto(AId: Integer): TContabilContaRateio;
begin
  sql := 'SELECT * FROM CONTABIL_CONTA_RATEIO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TContabilContaRateio>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TContabilContaRateioService.Inserir(AContabilContaRateio: TContabilContaRateio);
begin
  AContabilContaRateio.ValidarInsercao;
  AContabilContaRateio.Id := InserirBase(AContabilContaRateio, 'CONTABIL_CONTA_RATEIO');
  
end;

class function TContabilContaRateioService.Alterar(AContabilContaRateio: TContabilContaRateio): Integer;
begin
  AContabilContaRateio.ValidarAlteracao;
  Result := AlterarBase(AContabilContaRateio, 'CONTABIL_CONTA_RATEIO');
  
  
end;


class function TContabilContaRateioService.Excluir(AContabilContaRateio: TContabilContaRateio): Integer;
begin
  AContabilContaRateio.ValidarExclusao;
  
  Result := ExcluirBase(AContabilContaRateio.Id, 'CONTABIL_CONTA_RATEIO');
end;


end.
