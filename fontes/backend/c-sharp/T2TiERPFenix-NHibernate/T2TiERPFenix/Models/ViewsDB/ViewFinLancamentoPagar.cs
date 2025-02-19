/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [VIEW_FIN_LANCAMENTO_PAGAR] 
                                                                                
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
*******************************************************************************/

namespace T2TiERPFenix.Models
{
    public class ViewFinLancamentoPagar
    {	
		public int Id { get; set; }

		public int? IdFinLancamentoPagar { get; set; }

		public int? QuantidadeParcela { get; set; }

		public System.Nullable<System.Decimal> ValorLancamento { get; set; }

		public System.Nullable<System.DateTime> DataLancamento { get; set; }

		public string NumeroDocumento { get; set; }

		public int? IdFinParcelaPagar { get; set; }

		public int? NumeroParcela { get; set; }

		public System.Nullable<System.DateTime> DataVencimento { get; set; }

		public System.Nullable<System.DateTime> DataPagamento { get; set; }

		public System.Nullable<System.Decimal> ValorParcela { get; set; }

		public System.Nullable<System.Decimal> TaxaJuro { get; set; }

		public System.Nullable<System.Decimal> ValorJuro { get; set; }

		public System.Nullable<System.Decimal> TaxaMulta { get; set; }

		public System.Nullable<System.Decimal> ValorMulta { get; set; }

		public System.Nullable<System.Decimal> TaxaDesconto { get; set; }

		public System.Nullable<System.Decimal> ValorDesconto { get; set; }

		public string SiglaDocumento { get; set; }

		public string NomeFornecedor { get; set; }

		public int? IdFinStatusParcela { get; set; }

		public string SituacaoParcela { get; set; }

		public string DescricaoSituacaoParcela { get; set; }

		public int? IdBancoContaCaixa { get; set; }

		public string NomeContaCaixa { get; set; }

    }
}
