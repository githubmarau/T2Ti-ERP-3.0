/*******************************************************************************
Title: T2Ti ERP 3.0                                                                
Description: Model relacionado à tabela [CTE_INFORMACAO_NF_OUTROS] 
                                                                                
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

namespace T2TiERPFenix.Models
{
    public class CteInformacaoNfOutros
    {	
		public int Id { get; set; }

		public int? IdCteCabecalho { get; set; }

		public string NumeroRomaneio { get; set; }

		public string NumeroPedido { get; set; }

		public string ChaveAcessoNfe { get; set; }

		public string CodigoModelo { get; set; }

		public string Serie { get; set; }

		public string Numero { get; set; }

		public System.Nullable<System.DateTime> DataEmissao { get; set; }

		public int? UfEmitente { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIcms { get; set; }

		public System.Nullable<System.Decimal> ValorIcms { get; set; }

		public System.Nullable<System.Decimal> BaseCalculoIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorIcmsSt { get; set; }

		public System.Nullable<System.Decimal> ValorTotalProdutos { get; set; }

		public System.Nullable<System.Decimal> ValorTotal { get; set; }

		public int? CfopPredominante { get; set; }

		public System.Nullable<System.Decimal> PesoTotalKg { get; set; }

		public int? PinSuframa { get; set; }

		public System.Nullable<System.DateTime> DataPrevistaEntrega { get; set; }

		public string OutroTipoDocOrig { get; set; }

		public string OutroDescricao { get; set; }

		public System.Nullable<System.Decimal> OutroValorDocumento { get; set; }

    }
}
