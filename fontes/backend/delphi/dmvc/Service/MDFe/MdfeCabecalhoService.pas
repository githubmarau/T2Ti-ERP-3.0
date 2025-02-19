{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Service relacionado à tabela [MDFE_CABECALHO] 
                                                                                
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
unit MdfeCabecalhoService;

interface

uses
  MdfeCabecalho, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TMdfeCabecalhoService = class(TServiceBase)
  private
  public
    class function ConsultarLista: TObjectList<TMdfeCabecalho>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TMdfeCabecalho>;
    class function ConsultarObjeto(AId: Integer): TMdfeCabecalho;
    class procedure Inserir(AMdfeCabecalho: TMdfeCabecalho);
    class function Alterar(AMdfeCabecalho: TMdfeCabecalho): Integer;
    class function Excluir(AMdfeCabecalho: TMdfeCabecalho): Integer;
  end;

var
  sql: string;


implementation

{ TMdfeCabecalhoService }



class function TMdfeCabecalhoService.ConsultarLista: TObjectList<TMdfeCabecalho>;
begin
  sql := 'SELECT * FROM MDFE_CABECALHO ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TMdfeCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TMdfeCabecalhoService.ConsultarListaFiltro(AWhere: string): TObjectList<TMdfeCabecalho>;
begin
  sql := 'SELECT * FROM MDFE_CABECALHO where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TMdfeCabecalho>;
    
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TMdfeCabecalhoService.ConsultarObjeto(AId: Integer): TMdfeCabecalho;
begin
  sql := 'SELECT * FROM MDFE_CABECALHO WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TMdfeCabecalho>;
      
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TMdfeCabecalhoService.Inserir(AMdfeCabecalho: TMdfeCabecalho);
begin
  AMdfeCabecalho.ValidarInsercao;
  AMdfeCabecalho.Id := InserirBase(AMdfeCabecalho, 'MDFE_CABECALHO');
  
end;

class function TMdfeCabecalhoService.Alterar(AMdfeCabecalho: TMdfeCabecalho): Integer;
begin
  AMdfeCabecalho.ValidarAlteracao;
  Result := AlterarBase(AMdfeCabecalho, 'MDFE_CABECALHO');
  
  
end;


class function TMdfeCabecalhoService.Excluir(AMdfeCabecalho: TMdfeCabecalho): Integer;
begin
  AMdfeCabecalho.ValidarExclusao;
  
  Result := ExcluirBase(AMdfeCabecalho.Id, 'MDFE_CABECALHO');
end;


end.
