{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [VIEW_PESSOA_FORNECEDOR] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
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
unit ViewPessoaFornecedorService;

interface

uses
  ViewPessoaFornecedor, 
  System.SysUtils, System.Generics.Collections, ServiceBase, MVCFramework.DataSet.Utils;

type

  TViewPessoaFornecedorService = class(TServiceBase)
  private
    class procedure AnexarObjetosVinculados(AListaViewPessoaFornecedor: TObjectList<TViewPessoaFornecedor>); overload;
    class procedure AnexarObjetosVinculados(AViewPessoaFornecedor: TViewPessoaFornecedor); overload;
  public
    class function ConsultarLista: TObjectList<TViewPessoaFornecedor>;
    class function ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaFornecedor>;
    class function ConsultarObjeto(AId: Integer): TViewPessoaFornecedor;
    class procedure Inserir(AViewPessoaFornecedor: TViewPessoaFornecedor);
    class function Alterar(AViewPessoaFornecedor: TViewPessoaFornecedor): Integer;
    class function Excluir(AViewPessoaFornecedor: TViewPessoaFornecedor): Integer;
  end;

var
  sql: string;


implementation

{ TViewPessoaFornecedorService }

class procedure TViewPessoaFornecedorService.AnexarObjetosVinculados(AViewPessoaFornecedor: TViewPessoaFornecedor);
begin
end;

class procedure TViewPessoaFornecedorService.AnexarObjetosVinculados(AListaViewPessoaFornecedor: TObjectList<TViewPessoaFornecedor>);
var
  ViewPessoaFornecedor: TViewPessoaFornecedor;
begin
  for ViewPessoaFornecedor in AListaViewPessoaFornecedor do
  begin
    AnexarObjetosVinculados(ViewPessoaFornecedor);
  end;
end;

class function TViewPessoaFornecedorService.ConsultarLista: TObjectList<TViewPessoaFornecedor>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_FORNECEDOR ORDER BY ID';
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaFornecedor>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaFornecedorService.ConsultarListaFiltro(AWhere: string): TObjectList<TViewPessoaFornecedor>;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_FORNECEDOR where ' + AWhere;
  try
    Result := GetQuery(sql).AsObjectList<TViewPessoaFornecedor>;
    AnexarObjetosVinculados(Result);
  finally
    Query.Close;
    Query.Free;
  end;
end;

class function TViewPessoaFornecedorService.ConsultarObjeto(AId: Integer): TViewPessoaFornecedor;
begin
  sql := 'SELECT * FROM VIEW_PESSOA_FORNECEDOR WHERE ID = ' + IntToStr(AId);
  try
    GetQuery(sql);
    if not Query.Eof then
    begin
      Result := Query.AsObject<TViewPessoaFornecedor>;
      AnexarObjetosVinculados(Result);
    end
    else
      Result := nil;
  finally
    Query.Close;
    Query.Free;
  end;
end;

class procedure TViewPessoaFornecedorService.Inserir(AViewPessoaFornecedor: TViewPessoaFornecedor);
begin
  AViewPessoaFornecedor.ValidarInsercao;
  AViewPessoaFornecedor.Id := InserirBase(AViewPessoaFornecedor, 'VIEW_PESSOA_FORNECEDOR');
  
end;

class function TViewPessoaFornecedorService.Alterar(AViewPessoaFornecedor: TViewPessoaFornecedor): Integer;
begin
  AViewPessoaFornecedor.ValidarAlteracao;
  Result := AlterarBase(AViewPessoaFornecedor, 'VIEW_PESSOA_FORNECEDOR');
  
  
end;


class function TViewPessoaFornecedorService.Excluir(AViewPessoaFornecedor: TViewPessoaFornecedor): Integer;
begin
  AViewPessoaFornecedor.ValidarExclusao;
  
  Result := ExcluirBase(AViewPessoaFornecedor.Id, 'VIEW_PESSOA_FORNECEDOR');
end;


end.
