/*
Title: T2Ti ERP 3.0                                                                
Description: ListaPage relacionada à tabela [TRIBUT_ISS] 
                                                                                
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'package:fenix/src/infra/sessao.dart';
import 'package:fenix/src/infra/constantes.dart';

import 'package:fenix/src/view/shared/view_util_lib.dart';
import 'package:fenix/src/view/shared/botoes.dart';
import 'package:fenix/src/infra/atalhos_desktop_web.dart';
import 'package:fenix/src/view/shared/caixas_de_dialogo.dart';

import 'package:fenix/src/model/model.dart';
import 'package:fenix/src/model/filtro.dart';
import 'package:fenix/src/view_model/view_model.dart';

import 'package:fenix/src/view/shared/page/filtro_page.dart';
import 'package:fenix/src/view/shared/page/pdf_page.dart';

import 'tribut_iss_persiste_page.dart';

class TributIssListaPage extends StatefulWidget {
  const TributIssListaPage({Key? key}) : super(key: key);

  @override
  TributIssListaPageState createState() => TributIssListaPageState();
}

class TributIssListaPageState extends State<TributIssListaPage> {
  int? _rowsPerPage = Constantes.paginatedDataTableLinhasPorPagina;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  Filtro? _filtro = Filtro();
  final _colunas = TributIss.colunas;
  final _campos = TributIss.campos;

  final ScrollController _scrollController = ScrollController();

  Map<LogicalKeySet, Intent>? _shortcutMap; 
  Map<Type, Action<Intent>>? _actionMap;

  @override
  void initState() {
    super.initState();
    _shortcutMap = getAtalhosListaPage();

    _actionMap = <Type, Action<Intent>>{
      AtalhoTelaIntent: CallbackAction<AtalhoTelaIntent>(
        onInvoke: _tratarAcoesAtalhos,
      ),
    };
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Sessao.tratarErrosSessao(context, Provider.of<TributIssViewModel>(context, listen: false).objetoJsonErro)
    );
    super.didChangeDependencies();
  }
  
  void _tratarAcoesAtalhos(AtalhoTelaIntent intent) {
    switch (intent.type) {
      case AtalhoTelaType.inserir:
        _inserir();
        break;
      case AtalhoTelaType.imprimir:
        _gerarRelatorio();
        break;
      case AtalhoTelaType.filtrar:
        _chamarFiltro();
        break;
      default:
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    final listaTributIss = Provider.of<TributIssViewModel>(context).listaTributIss;
    final objetoJsonErro = Provider.of<TributIssViewModel>(context).objetoJsonErro;

    if (listaTributIss == null && objetoJsonErro == null) {
      Provider.of<TributIssViewModel>(context, listen: false).consultarLista();
    }
  
    final _TributIssDataSource tributIssDataSource = _TributIssDataSource(listaTributIss, context);

    void sort<T>(Comparable<T>? Function(TributIss tributIss) getField, int columnIndex, bool ascending) {
      tributIssDataSource.sort<T>(getField, ascending);
      setState(() {
        _sortColumnIndex = columnIndex;
        _sortAscending = ascending;
      });
    }
	
      return FocusableActionDetector(
        actions: _actionMap,
        shortcuts: _shortcutMap,
        child: Focus(
          autofocus: true,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Cadastro - Tribut Iss'),
              actions: const <Widget>[],
            ),
            floatingActionButton: FloatingActionButton(
              focusColor: ViewUtilLib.getBotaoFocusColor(),
              tooltip: Constantes.botaoInserirDica,
              backgroundColor: ViewUtilLib.getBackgroundColorBotaoInserir(),
              child: ViewUtilLib.getIconBotaoInserir(),
              onPressed: () {
                _inserir();
              }),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            bottomNavigationBar: BottomAppBar(
              color: ViewUtilLib.getBottomAppBarColor(),          
              shape: const CircularNotchedRectangle(),
              child: Row(
                children: getBotoesNavigationBarListaPage(
                  context: context, 
                  chamarFiltro: _chamarFiltro, 
                  gerarRelatorio: _gerarRelatorio,
                ),
              ),
            ),
            body: RefreshIndicator(
              onRefresh: _refrescarTela,
              child: Scrollbar(
              controller: _scrollController,
                child: listaTributIss == null
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                controller: _scrollController,                
                  padding: const EdgeInsets.all(Constantes.paddingListViewListaPage),
                  children: <Widget>[
                    PaginatedDataTable(                        
                      header: const Text('Relação - Tribut Iss'),
                      rowsPerPage: _rowsPerPage!,
                      onRowsPerPageChanged: (int? value) {
                        setState(() {
                          _rowsPerPage = value;
                        });
                      },
                      sortColumnIndex: _sortColumnIndex,
                      sortAscending: _sortAscending,
                      columns: <DataColumn>[
                        DataColumn(
                          numeric: true,
                          label: const Text('Id'),
                          tooltip: 'Id',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((TributIss tributIss) => tributIss.id, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Operação Fiscal'),
                          tooltip: 'Operação Fiscal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((TributIss tributIss) => tributIss.tributOperacaoFiscal?.descricao, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Modalidade Base Cálculo'),
                          tooltip: 'Modalidade Base Cálculo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((TributIss tributIss) => tributIss.modalidadeBaseCalculo, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Porcento Base Cálculo'),
                          tooltip: 'Porcento Base Cálculo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((TributIss tributIss) => tributIss.porcentoBaseCalculo, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Alíquota Porcento'),
                          tooltip: 'Alíquota Porcento',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((TributIss tributIss) => tributIss.aliquotaPorcento, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Alíquota Unidade'),
                          tooltip: 'Alíquota Unidade',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((TributIss tributIss) => tributIss.aliquotaUnidade, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Preço Máximo'),
                          tooltip: 'Valor Preço Máximo',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((TributIss tributIss) => tributIss.valorPrecoMaximo, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Valor Pauta Fiscal'),
                          tooltip: 'Valor Pauta Fiscal',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((TributIss tributIss) => tributIss.valorPautaFiscal, columnIndex, ascending),
                        ),
                        DataColumn(
                          numeric: true,
                          label: const Text('Item Lista Serviço'),
                          tooltip: 'Item Lista Serviço',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<num>((TributIss tributIss) => tributIss.itemListaServico, columnIndex, ascending),
                        ),
                        DataColumn(
                          label: const Text('Código Tributação'),
                          tooltip: 'Código Tributação',
                          onSort: (int columnIndex, bool ascending) =>
                            sort<String>((TributIss tributIss) => tributIss.codigoTributacao, columnIndex, ascending),
                        ),
                      ],
                      source: tributIssDataSource,
                    ),
                  ],
                ),
              ),
            ),          
          ),
        ),
      );
  }

  void _inserir() {
    Navigator.of(context)
      .push(MaterialPageRoute(
        builder: (BuildContext context) => 
          TributIssPersistePage(tributIss: TributIss(), title: 'Tribut Iss - Inserindo', operacao: 'I')))
      .then((_) {
        Provider.of<TributIssViewModel>(context, listen: false).consultarLista();
    });
  }

  void _chamarFiltro() async {
    _filtro = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => FiltroPage(
            title: 'Tribut Iss - Filtro',
            colunas: _colunas,
            filtroPadrao: true,
          ),
          fullscreenDialog: true,
        ));
    if (!mounted) return;
    if (_filtro != null) {
      if (_filtro!.campo != null) {
        _filtro!.campo = _campos[int.parse(_filtro!.campo!)];
        await Provider.of<TributIssViewModel>(context, listen: false).consultarLista(filtro: _filtro);
      }
    }    
  }

  Future _gerarRelatorio() async {
    gerarDialogBoxConfirmacao(
      context, Constantes.perguntaGerarRelatorio, () async {
      Navigator.of(context).pop();

      if (kIsWeb) {
        await Provider.of<TributIssViewModel>(context).visualizarPdfWeb(filtro: _filtro);
      } else {
        final arquivoPdf = await Provider.of<TributIssViewModel>(context).visualizarPdf(filtro: _filtro);
        if (!mounted) return;
        Navigator.of(context)
          .push(MaterialPageRoute(
            builder: (BuildContext context) => PdfPage(arquivoPdf: arquivoPdf, title: 'Relatório - Tribut Iss')));
      }
    });
  }

  Future _refrescarTela() async {
    await Provider.of<TributIssViewModel>(context, listen: false).consultarLista();
    return null;
  }
}

/// codigo referente a fonte de dados
class _TributIssDataSource extends DataTableSource {
  final List<TributIss>? listaTributIss;
  final BuildContext context;

  _TributIssDataSource(this.listaTributIss, this.context);

  void sort<T>(Comparable<T>? Function(TributIss tributIss) getField, bool ascending) {
    listaTributIss!.sort((TributIss a, TributIss b) {
      if (!ascending) {
        final TributIss c = a;
        a = b;
        b = c;
      }
      Comparable<T>? aValue = getField(a);
      Comparable<T>? bValue = getField(b);

      aValue ??= '' as Comparable<T>;
      bValue ??= '' as Comparable<T>;

      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  final int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listaTributIss!.length) return null;
    final TributIss tributIss = listaTributIss![index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text('${tributIss.id ?? ''}'), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(tributIss.tributOperacaoFiscal?.descricao ?? ''), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(tributIss.modalidadeBaseCalculo ?? ''), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIss.porcentoBaseCalculo ?? 0)), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIss.aliquotaPorcento ?? 0)), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(Constantes.formatoDecimalTaxa.format(tributIss.aliquotaUnidade ?? 0)), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIss.valorPrecoMaximo ?? 0)), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(Constantes.formatoDecimalValor.format(tributIss.valorPautaFiscal ?? 0)), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text('${tributIss.itemListaServico ?? ''}'), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
        DataCell(Text(tributIss.codigoTributacao ?? ''), onTap: () {
          _detalharTributIss(tributIss, context);
        }),
      ],
    );
  }

  @override
  int get rowCount => listaTributIss!.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}

void _detalharTributIss(TributIss tributIss, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => 
        TributIssPersistePage(tributIss: tributIss, title: 'Tribut Iss - Editando', operacao: 'A')));
}