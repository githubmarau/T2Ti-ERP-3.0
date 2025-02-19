{*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Controller relacionado à tabela [FOLHA_PPP_FATOR_RISCO] 
                                                                                
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
unit FolhaPppFatorRiscoController;

interface

uses mvcframework, mvcframework.Commons,
  System.SysUtils,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('CRUD FolhaPppFatorRisco')]
  [MVCPath('/folha-ppp-fator-risco')]
  TFolhaPppFatorRiscoController = class(TMVCController)
  public
    [MVCDoc('Retorna uma lista de objetos')]
    [MVCPath('/($filtro)')]
    [MVCHTTPMethod([httpGET])]
    procedure ConsultarLista(Context: TWebContext);

    [MVCDoc('Retorna um objeto com base no ID')]
    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpGET])]
    procedure ConsultarObjeto(id: Integer);

    [MVCDoc('Insere um novo objeto')]
    [MVCPath]
    [MVCHTTPMethod([httpPOST])]
    procedure Inserir(Context: TWebContext);

    [MVCDoc('Altera um objeto com base no ID')]
    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpPUT])]
    procedure Alterar(id: Integer);

    [MVCDoc('Exclui um objeto com base no ID')]
    [MVCPath('/($id)')]
    [MVCHTTPMethod([httpDelete])]
    procedure Excluir(id: Integer);
  end;

implementation

{ TFolhaPppFatorRiscoController }

uses FolhaPppFatorRiscoService, FolhaPppFatorRisco, Commons, Filtro;

procedure TFolhaPppFatorRiscoController.ConsultarLista(Context: TWebContext);
var
  FiltroUrl, FilterWhere: string;
  FiltroObj: TFiltro;
begin
  FiltroUrl := Context.Request.Params['filtro'];
  if FiltroUrl <> '' then
  begin
    ConsultarObjeto(StrToInt(FiltroUrl));
    exit;
  end;

  FilterWhere := Context.Request.Params['filter'];
  try
    if FilterWhere = '' then
    begin
      Render<TFolhaPppFatorRisco>(TFolhaPppFatorRiscoService.ConsultarLista);
    end
    else begin
      // define o objeto filtro
      FiltroObj := TFiltro.Create(FilterWhere);
      Render<TFolhaPppFatorRisco>(TFolhaPppFatorRiscoService.ConsultarListaFiltro(FiltroObj.Where));
    end;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Lista FolhaPppFatorRisco] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaPppFatorRiscoController.ConsultarObjeto(id: Integer);
var
  FolhaPppFatorRisco: TFolhaPppFatorRisco;
begin
  try
    FolhaPppFatorRisco := TFolhaPppFatorRiscoService.ConsultarObjeto(id);

    if Assigned(FolhaPppFatorRisco) then
      Render(FolhaPppFatorRisco)
    else
      raise EMVCException.Create
        ('Registro não localizado [Consultar Objeto FolhaPppFatorRisco]', '', 0, 404);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Consultar Objeto FolhaPppFatorRisco] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

procedure TFolhaPppFatorRiscoController.Inserir(Context: TWebContext);
var
  FolhaPppFatorRisco: TFolhaPppFatorRisco;
begin
  try
    FolhaPppFatorRisco := Context.Request.BodyAs<TFolhaPppFatorRisco>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Inserir FolhaPppFatorRisco] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  try
    TFolhaPppFatorRiscoService.Inserir(FolhaPppFatorRisco);
    Render(TFolhaPppFatorRiscoService.ConsultarObjeto(FolhaPppFatorRisco.Id));
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Problemas na inserção [Inserir FolhaPppFatorRisco] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;
end;

procedure TFolhaPppFatorRiscoController.Alterar(id: Integer);
var
  FolhaPppFatorRisco, FolhaPppFatorRiscoDB: TFolhaPppFatorRisco;
begin
  try
    FolhaPppFatorRisco := Context.Request.BodyAs<TFolhaPppFatorRisco>;
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create('Objeto inválido [Alterar FolhaPppFatorRisco] - Exceção: ' +
        E.Message, E.StackTrace, 0, 400);
    end
    else
      raise;
  end;

  if FolhaPppFatorRisco.Id <> id then
    raise EMVCException.Create('Objeto inválido [Alterar FolhaPppFatorRisco] - ID do objeto difere do ID da URL.',
      '', 0, 400);

  FolhaPppFatorRiscoDB := TFolhaPppFatorRiscoService.ConsultarObjeto(FolhaPppFatorRisco.id);

  if not Assigned(FolhaPppFatorRiscoDB) then
    raise EMVCException.Create('Objeto com ID inválido [Alterar FolhaPppFatorRisco]',
      '', 0, 400);

  try
    if TFolhaPppFatorRiscoService.Alterar(FolhaPppFatorRisco) > 0 then
      Render(TFolhaPppFatorRiscoService.ConsultarObjeto(FolhaPppFatorRisco.Id))
    else
      raise EMVCException.Create('Nenhum registro foi alterado [Alterar FolhaPppFatorRisco]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaPppFatorRiscoDB);
  end;
end;

procedure TFolhaPppFatorRiscoController.Excluir(id: Integer);
var
  FolhaPppFatorRisco: TFolhaPppFatorRisco;
begin
  FolhaPppFatorRisco := TFolhaPppFatorRiscoService.ConsultarObjeto(id);

  if not Assigned(FolhaPppFatorRisco) then
    raise EMVCException.Create('Objeto com ID inválido [Excluir FolhaPppFatorRisco]',
      '', 0, 400);

  try
    if TFolhaPppFatorRiscoService.Excluir(FolhaPppFatorRisco) > 0 then
      Render(200, 'Objeto excluído com sucesso.')
    else
      raise EMVCException.Create('Nenhum registro foi excluído [Excluir FolhaPppFatorRisco]',
        '', 0, 500);
  finally
    FreeAndNil(FolhaPppFatorRisco);
  end;
end;

end.
