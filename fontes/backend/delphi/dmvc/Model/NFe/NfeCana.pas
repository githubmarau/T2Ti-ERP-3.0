{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_CANA] 
                                                                                
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
unit NfeCana;

interface

uses
  Generics.Collections, System.SysUtils,
  NfeCanaDeducoesSafra, NfeCanaFornecimentoDiario, 
  MVCFramework.Serializer.Commons, ModelBase;

type

  [MVCNameCase(ncCamelCase)]
  TNfeCana = class(TModelBase)
  private
    FId: Integer;
    FIdNfeCabecalho: Integer;
    FSafra: string;
    FMesAnoReferencia: string;
      
    FListaNfeCanaDeducoesSafra: TObjectList<TNfeCanaDeducoesSafra>;
    FListaNfeCanaFornecimentoDiario: TObjectList<TNfeCanaFornecimentoDiario>;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    [MVCColumnAttribute('ID', True)]
		[MVCNameAsAttribute('id')]
		property Id: Integer read FId write FId;
    [MVCColumnAttribute('ID_NFE_CABECALHO')]
		[MVCNameAsAttribute('idNfeCabecalho')]
		property IdNfeCabecalho: Integer read FIdNfeCabecalho write FIdNfeCabecalho;
    [MVCColumnAttribute('SAFRA')]
		[MVCNameAsAttribute('safra')]
		property Safra: string read FSafra write FSafra;
    [MVCColumnAttribute('MES_ANO_REFERENCIA')]
		[MVCNameAsAttribute('mesAnoReferencia')]
		property MesAnoReferencia: string read FMesAnoReferencia write FMesAnoReferencia;
      
    [MapperListOf(TNfeCanaDeducoesSafra)]
	[MVCNameAsAttribute('listaNfeCanaDeducoesSafra')]
	property ListaNfeCanaDeducoesSafra: TObjectList<TNfeCanaDeducoesSafra> read FListaNfeCanaDeducoesSafra write FListaNfeCanaDeducoesSafra;
    [MapperListOf(TNfeCanaFornecimentoDiario)]
	[MVCNameAsAttribute('listaNfeCanaFornecimentoDiario')]
	property ListaNfeCanaFornecimentoDiario: TObjectList<TNfeCanaFornecimentoDiario> read FListaNfeCanaFornecimentoDiario write FListaNfeCanaFornecimentoDiario;
  end;

implementation

{ TNfeCana }

constructor TNfeCana.Create;
begin
  inherited;

  FListaNfeCanaDeducoesSafra := TObjectList<TNfeCanaDeducoesSafra>.Create;
  FListaNfeCanaFornecimentoDiario := TObjectList<TNfeCanaFornecimentoDiario>.Create;
end;

destructor TNfeCana.Destroy;
begin
  FreeAndNil(FListaNfeCanaDeducoesSafra);
  FreeAndNil(FListaNfeCanaFornecimentoDiario);
  inherited;
end;



end.